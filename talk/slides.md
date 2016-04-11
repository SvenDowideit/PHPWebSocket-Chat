
# Dockerize your application stack
## Sven Dowideit

Learn how to take a working web app with several moving parts to a 
set of Docker containers that can be used to develop, test and deploy with.
Bring your own application stack, or learn by working with the one I use as the example.
We'll cover migration, development and local testing. 

Then deploy to the Cloud, and anything the group wants to cover.

# What can Docker do.

Build Ship and Run

# Experimentation

* Start a container, do some silly things - delete everything
* stop it, start a new one - look, its ok

alpine, debian, fedora, 


# What are containers

Its a process, with some settings that limit its ability to see outside its "wrapper"

default limits: network, filesystem, userspace, resources

# Build: Creating a Container filesystem

Docker images are built using either a tar file - `docker import`, or
by building the image using a `Dockerfile` definition.

## FROM
## MAINTINER
## RUN 
## CMD / ENTRYPOINT
## ENV / ARG

# Ship: making Images available

Hub, `docker push`, `docker pull`, private registrys

# Run: locally

`docker run ...`

# Run: more than one

show `docker-compose`

# Run: in cloud.docker.com

# Run: Swarm / UCP

Make the demo box a UCP master, and join the 2 notebooks to it? Then run the chat app over 3 computers - redis db on the DO box, and then have 2 websocket servers talking to it?

shows how the overlay network makes connecting containers transparent
