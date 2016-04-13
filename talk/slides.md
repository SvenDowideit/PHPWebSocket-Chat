# Dockerize your application stack
## Sven Dowideit

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/

Please start by installing __Docker Toolbox__

       https://www.docker.com/products/docker-toolbox

# What can Docker do.

Build, Ship and Run

# Experimentation

* Start a container, do some silly things - delete everything
* stop it, start a new one - look, its ok

alpine, debian, fedora


# What are containers

Its a process, with some settings that limit its ability to see outside its "wrapper"

default limits: process, filesystem, user, network, control groups

# Build: Creating a Container filesystem

Docker images are built using either a tar file - `docker import`, or
by building the image using a `Dockerfile` definition.

## FROM
## MAINTINER
## RUN 
## CMD / ENTRYPOINT
## ENV / ARG

# What's a Docker Image

Its actually a union of filesystem layers - each of the Dockerfile instructions
cause a new layer to be made.

But - you can share layers.

* `docker images`
* `docer inspect`
* `docker history`
* `docker rmi`
* `docker tag`
* `save`, `load`, `export`, `import`, `commit`, `diff`

# Ship: making Images available

Hub, `docker login`, `docker push`, `docker search`, `docker pull`, private registrys

# Run: locally

`docker run ...`

* `docker run -d`
* `docker run -it --rm`

* `ps`, `stop`, `kill`, `ports`, `logs`, `top`, `stats`, `wait`
* `events`, `attach`
* `cp`
* `exec`

# Run: common settings

* `--ports`
* `--volumes`
* `--readonly`
* `--env` / `--env-file`
* `--name`
* `--workdir`
* `--link`
* `--net`

# Run: `docker network`

Create named networks, and dynamically dis/connect containers to them..
Same thing with `--link`

default `bridge`, `host`, `none` networks, create your own `bridge` and `overlay`

`docker network ls`
`docker network inspect`
`docker network create`

# Run: more than one

`docker-compose`

# Run: in cloud.docker.com

# Run: Swarm / UCP

# Lets start playing

Do we have anything specific in mind?