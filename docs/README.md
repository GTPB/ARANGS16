# ARANGS 2016

### Docker

#### Docker vs virtualization
*md table*
Docker  Virtualization
image   image
host    host
container   instance
* Containers use up less resources & space
* Several containers can share host resources
* They can have their package version without conflicts
*graphviz sch*
* Security issues ?
* Launch Docker image if available, else downloads them on the fly from Docker registry.
* Image vs client vs machine ?

[sch](http://www.google.fr/url?source=imglanding&ct=img&q=http://zdnet3.cbsistatic.com/hub/i/r/2014/10/02/1f130129-49e2-11e4-b6a0-d4ae52e95e57/resize/770x578/3f83f67acfa33fe05865373b2b4b71dd/docker-vm-container.png&sa=X&ei=MqVUVeS1K6rlsAS_kID4DQ&ved=0CAkQ8wc&usg=AFQjCNHynakxkWA3l42a6TRdpgbwufMhNA)
[sch2](http://www.google.pt/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0CAcQjRw&url=http%3A%2F%2Fwww.linformaticien.com%2Factualites%2Fid%2F33508%2Fdocker-1-0-l-outil-qui-va-booster-l-adoption-du-cloud.aspx&ei=Y6hUVZLNH42nyATptoCgCw&bvm=bv.93112503,d.cWc&psig=AFQjCNEpfqcUKnPSPqXd7Ryqn6EH3Orc0g&ust=1431697864253097)


## DAY 4

[Worksheet](https://github.com/dmlond/arangs2015/blob/master/docs/2015-05-13/intro_docker/Worksheet.md)
[Readme](https://github.com/dmlond/arangs2015/tree/master/docs/2015-05-13/intro_docker)
### Docker again

* So what are trhe differences beteween docker, docker machine and docker compose anyway ?
Answers can be found [here](http://flurdy.com/docs/docker/docker_compose_machine_swarm_cloud.html)

 
* Few links
 > Nice n quick Docker [tuto](http://www.docker.com/tryit)
 > [User](https://docs.docker.com/userguide/) [guides](https://docs.docker.com/machine/)
 > [Wikipedia](http://en.wikipedia.org/wiki/Docker_%28software%29)



#### Practice


* install docker-machine
* install docker
* create a docker-machine called arangs2015
```
docker-machine create --driver virtualbox arangs2015

```

* configure docker to talk to your arangs2015 docker-machine

```
eval "$(docker-machine env arangs2015)" # create ENV var

participant@t10:~/Desktop/arangs2015$ env | grep DOCKER
DOCKER_HOST=tcp://192.168.99.100:2376
DOCKER_TLS_VERIFY=1
DOCKER_CERT_PATH=/home/participant/.docker/machine/machines/arangs2015
```

* pull the busybox image from the Docker registry
```
docker search busybox
docker pull busybox
```
* run an interactive + tty sh session inside a busybox image container
`docker run -i -t busybox`

#### in another terminal

* list the docker-machines and their state
`docker-machine ls`
* configure docker to talk to your arangs2015 docker-machine
* list docker images
`docker images`
* list docker containers
`docker ps`

#### in the terminal where you are running busybox
    echo "HELLO WORLD"
    uname -a
    ls /
    try some other commands
    `exit`
    echo $?
    instead of running 'sh', run ls /notthere
    echo $?
    list out *all* containers
    rm all containers
```
docker ps -a
docker rm $(docker ps -aq)
```
 > There are as many containers as ran docker machines

`docker rm $ID`
    remove the busybox image
`docker images`


#### TODO
* run an interactive + tty irb session inside a ruby:latest container (do not pull first)

**inside the container**
```ruby
puts "HELLO WORLD"
puts "GOODBYE WORLD"
exit
```
* echo $?
* run it again
```
abort 'argh!'
```
* echo $?
* what did you see
#### End of TODO

* run an interactive + tty bash session inside a busybox container with your Host home directory mounted as a volume to /mydir

Settings:

VBox > arangs Settings > Sharing > setup home dir
Back to terminal
```
docker-machine ls
docker-machine ssh
```
**inside the container**
```
sudo mkdir /home/participant
sudo mount -t vboxsf HOME /home/participant
ls -ltr $HOME
```

#### TODO
echo "HI FROM DOCKER" > /mydir/hi.from.docker
exit
* ls ~/hi.from.docker
* cat ~/hi.from.docker
* rm ~/hi.from.docker
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
* stop the docker-machine.
#### End of TODO


## Beginning of DAY 4 program

[Worksheet](https://github.com/dmlond/arangs2015/tree/master/docs/2015-05-14/docker_build)
[Readme](https://github.com/dmlond/arangs2015/tree/master/docs/2015-05-14/)

* *Docker images are designed to host a single application and its dependencies. They are designed to run on the host as if natively installed. To compose a pipeline, you use or create docker images for each application required, and run containers from the host more or less hooked in to the host, similar to the way you would run a natively installed application.*
* *Docker images always must start from some other Docker image as a starting point.*
Syntax name/tag ex. Unbuntu/trusty
container or image ?
*"docker build context" needed -> dir -> docker file*
docker build dir = image

### Docker Compose

https://docs.docker.com/compose/install/
1.
su -
curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
2.
create dir
cd dir
3.
write docker file
4.
write docker-compose.yml
5.
build
6.
run

## Day 5

One more link about [docker](https://www.conetix.com.au/blog/what-is-docker?utm_content=buffer32d58&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
Alternatives to Docker: LXD, rkt.

