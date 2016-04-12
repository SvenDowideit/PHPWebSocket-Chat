<?php
use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

	// Make sure composer dependencies have been installed
	require __DIR__ . '/vendor/autoload.php';

/**
 * chat.php
 * Send any incoming messages to all connected clients (except sender)
 */
class MyChat implements MessageComponentInterface {
	protected $clients;
	protected $redis;

	public function __construct() {
	global $loop;
		$this->clients = new \SplObjectStorage;
		$this->redis = new Predis\Async\Client('tcp://dns1.fi.gy:6379', $loop);
	}

	public function onOpen(ConnectionInterface $conn) {
		$this->clients->attach($conn);
		$conn->send("You are {$conn->resourceId}");
		$this->redis->publish('chat', "{$conn->resourceId}:{$conn->remoteAddress} joined.");
	}

	public function onMessage(ConnectionInterface $from, $msg) {
		$this->redis->publish('chat', "{$from->resourceId}:{$msg}");
	}

	public function sendMsg($msg) {
		foreach ($this->clients as $client) {
			$client->send($msg);
		}
	}

	public function onClose(ConnectionInterface $conn) {
		$this->clients->detach($conn);
	}

	public function onError(ConnectionInterface $conn, \Exception $e) {
		$conn->close();
	}
}


$loop = new React\EventLoop\StreamSelectLoop();
$app = new Ratchet\App('localhost', 9300, '0.0.0.0', $loop);
$chat = new MyChat;
$app->route('/chat', $chat);
$app->route('/echo', new Ratchet\Server\EchoServer, array('*'));

$redis = new Predis\Async\Client('tcp://dns1.fi.gy:6379', $loop);
$redis->connect(function ($redis) use ($loop, $chat) {
	echo "Connected to Redis, now listening for incoming messages...\n";

	$redis->pubSubLoop('chat', function ($event) use ($chat){
		echo "event {$event->channel}, {$event->payload}\n";
				$chat->sendMsg($event->payload);
	});
});

$app->run();
