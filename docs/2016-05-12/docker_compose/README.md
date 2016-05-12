![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

Docker-Compose
--------------

The [docker-compose](https://docs.docker.com/compose/) command is a helpful system to use to automate building and running multiple, related docker build contexts. It is a thin wrapper around the docker command istself. Once installed on your system, it can be run in any directory containing a yaml file called docker-compose.yml (you can also override this and specify a path to a different yaml file using the -f flag to docker-compose). You can put one in the root of your project to specify how to build and run all of the images that are required to run your pipeline.

The docker-compose.yml file is a [YAML](http://yaml.org) file (YAML Ain't Markup Language). YAML is designed to be parsed into simple data structures in any programming language. A docker-compose.yml should specify a Hash that specifies one or more keys, called called 'services'.  Each service must specify a Hash of one or more arguments that tell docker-compose how to build or run the image for each service.

```yaml
service:
  argument1: value
  argument2: value
  ...
service2:
  argument1: value
  argument2: value
  ...
...
```

service arguments are specified in the [docker-compose.yml documentation](https://docs.docker.com/compose/yml/).  They are very similar to docker arguments:

-  `image: unbuntu:trusty` - says launch the ubuntu:trusty image for this service
- `build: path_to_build_context` - says build this build context into an image named 
  by joining the directory within which the docker-compose.yml is contained with an 
  underscore '\_' and the service name.
- `command:` - command argument argument says run the command and optional arguments 
  on the container.  Note, this behaves just like specifying a command in the docker 
  run syntax, so the command will behave differently if the Dockerfile for the image 
  has an ENTRYPOINT.
- `entrypoint:` - command says use this entrypoint, even if the Dockerfile for the 
  image has an ENTRYPOINT.
- `workdir:` path sets the WORKDIR for the running container to path, even if the 
  Dockerfile for the image has specified a WORKDIR.

Once you have a docker-compose.yml file, you can use docker-compose to build and run 
any/all services specified in it.

Build your service (the service MUST have a build argument):
```bash
$ docker-compose build service
```

Run your service (this will use any command, entrypoint, etc. specified for the service):
```bash
$ docker-compose run service
```

Override the command (not the entrypoint) for a service:
```bash
$ docker-compose run service bash
```

When you run a command for a service, it automatically specifies the -ti (interactive, with tty) flags to docker run.

The following would automatically run all services defined:
```bash
$ docker-compose up
```

If you want to spin up these services as background 'daemons':
```bash
$ docker-compose up -d
```
Then you can stop and rm any/all services with
```bash
$ docker-compose stop [service [service]...]
$ docker-compose rm [service [service] ...]
```
e.g. by default docker-compose stop and docker-compose rm stops or removes ALL services.

Resources
---------
* [docker-compose](https://docs.docker.com/compose/)
