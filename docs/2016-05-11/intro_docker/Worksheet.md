<!-- * Use `docker-machine` to create a docker machine called arangs2016
* Use `docker-machine env` to configure docker to talk to your arangs2015 docker-machine
* list the docker-machines and their state -->
* There are many _images_ with different OS and software available  in docker registries (e.g. [https://hub.docker.com/explore/](docker-hub)). Pull the 'busybox' image from the Docker hub. Which tag does the busybox image have?
* List all docker images running on your host
* Run `echo "Hello world"` in the docker container
* Run an interactive + tty sh session inside a busybox image container. You are now inside the busybox image. Which user are you?
* Open another terminal and list active docker containers. 

**in the terminal where you are running busybox**
* uname -a
* ls /
* try some other commands

** in another terminal
* list all containers
* list all running containers
* rm all containers

* remove the busybox image
* Run an interactive tty in a `ubuntu:trusty` docker container *without* pulling the `ubuntu:trusty` image beforehand
* Run `sleep 5` in the docker container. What is the difference if you provide the `-d` option to `docker run`?
* Use `docker create` to create a `ubuntu:trusty` container which echoes "Hello World"
* Use `docker start` to run the container. What does the `-a` option to `docker start` do? 

**shared directories**

* Look at how to share [https://docs.docker.com/engine/userguide/containers/dockervolumes/](a host directory as a data volume in the container)
* Create a directory in your current working directory which contains a file with some text
* Run a cat on this file specifying the above directory as shared to `docker run`
* Create a file within the docker container that is exposed to your host machine

<!--
* run a background (daemon) tutum/hello-world container, with a name 'helloworld', and exposed port 80
* list out the running containers
* dump the log of the helloworld container
* inspect the helloworld container
* find out what port on your Host port 80 of the container is exposed to

**in another terminal**

* find out which ip address is used by the docker-machine

**open your browser**

* navigate to http://$docker-machine-ip:$HELLOPORT
* what do you see?
* stop the helloworld container
* rm the helloworld container
* rerun the helloworld container, but do not export port 80 (remove '-p 80')

**open your browser**

* navigate to http://$docker-machine-ip:$HELLOPORT
* what do you see now?

**in the terminal**

* run an interactive + tty 'sh' session inside another tutum/hello-world container linked to the 'helloworld' container as helloworld

**inside the container**

```
wget -O - http://helloword
exit
```
* why did you not have to put a PORT on the url above?
* stop the running 'helloworld' container
* remove all containers

**in the terminal**

* list and remove all stopped containers
* list and remove all images
* remove all images
* stop the docker-machine
-->
