### Getting started with the `Docker` command-line interface

There are many _images_ with different OS and software available  in docker registries (e.g. [https://hub.docker.com/explore/](docker-hub)). We will start with downloading the tiny UNIX based operating system Busybox. Pull the 'busybox' image from the Docker hub. 

## Listing available images and containers
To keep track of your images and containers, docker offers the subcommands `docker images` and `docker ps`.

* Which tag does the busybox image have?
* List all docker images running on your host
* Are there any (running) containers?

## Creating containers and running commands on them
There are several ways to create docker containers. One of them is `docker run` which requires specifying the
image that the container is instanciated from. It is very worthwile to browse through the options of this subcommand (`docker help run`).

* Run the command `echo "Hello world"` in a docker container using the busybox image
* Run an interactive + tty sh session (open a interactive shell) inside a busybox image container. You are now inside the busybox container. Which user are you?
* Open another terminal and list active docker containers. 

## in the terminal where you are running busybox
* uname -a
* ls /
* try some other commands

**in another terminal**

* list all containers
* list all running containers
* rm all containers
* remove the busybox image

* Run an interactive tty in a `ubuntu:trusty` docker container *without* pulling the `ubuntu:trusty` image beforehand
* Run `sleep 5` in the docker container. What is the difference if you provide the `-detach` option to `docker run`?
* Use `docker create` to create a `ubuntu:trusty` container which echoes "Hello World"
* Use `docker start` to run the container. What does the `--attach` option to `docker start` do? 

## shared directories
Of course, one wants to share data between the host environment and the running container. This is easily possible
with the `--volume` or `-v` command passed to `docker run`.

* Look at how to share [https://docs.docker.com/engine/userguide/containers/dockervolumes/](a host directory as a data volume in the container)
* Create a directory in your current working directory which contains a file with some text
* Run a cat on this file specifying the above directory as shared to `docker run`
* Create a file within the docker container that is exposed to your host machine

## Host/Container communication
Next we will see how, with just a few commands, we can expoose ports and thereby etsablish commonication between containers and hosts. We will install an apache server on a running container and access it from the host machine.

* Run an interactive bash shell using the `ubuntu:trusty` image. 
* Within the container, install the apache web server: `apt-get update && apt-get install apache2`.

At this point, it is important to note that once you stop the container and re-open a shell with `docker run` from the same image, your changes (the apache installation) will be lost. To keep the changes, you will have to create an image from your container. 

