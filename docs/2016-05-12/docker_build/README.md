![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

Building Docker Images
======================

You create a Docker image in a fashion similar to the way you create a Vangrant Box.

- Create a directory for the image
- Put a Dockerfile in that directory
- Put any files/directories that need to be added to the image when it is built into the directory with the Dockerfile

This directory is called the build context for your image.  Once you have a build context, you use the docker commandline tool to build an image from the build context, with a name and optional tag.
```bash
$ docker build -t name[:tag] /path/to/build_context
```

Dockerfile
----------

The Dockerfile is a text file with one or more lines which start with a Dockerfile command, followed by the arguments to provide to the command. To get an idea of the Dockerfile commands, and their arguments, you can use the very good [Docker documentation](https://docs.docker.com/reference/builder/).  But, Dockerfiles are everywhere

- https://registry.hub.docker.com/u/tutum/hello-world/dockerfile/
- https://github.com/dmlond/bwa_samtools_base/blob/master/Dockerfile
- https://github.com/docker-library/ruby/blob/4ccabb5557ce2001aa1ae2a5f719340eb33c0383/2.0/wheezy/Dockerfile

You should not be afraid to steal Dockerfile syntax from other Dockerfiles.

#### `FROM otherimagename[:tag]`

Docker images always must start from some other Docker image as a starting point. This makes it easy to build up an image from the
starting point of a previously well defined image. Typically, you will start from one of the official, verified base images for the major \*Nix distributions (e.g. ubuntu:trust). This is not required.  You can start from any image that provides functionality that you want to use/extend/modify in your new image.  This is the ONLY required command in your Dockerfile.  All others are optional.  The following one-line Dockerfile will build a new image, with its own name, from ubuntu:trusty

```
FROM ubuntu:trusty
```

#### `MAINTANER Full Name <email>`

This is an optional command.  It is most useful if you plan on hosting your image on the Global Docker registry, which indexes the MAINTAINER and allows users to search for your images.  It also gives people your contact information if they need to contact you.

#### `ADD file_in_build_context /path/on/image`

This commands tells the docker tool to add the file in your build context to the image at the exact path specified. This can be a single file, or an entire directory. The path to the 'file_in_build_context' must be relative to the Dockerfile.  The /path/to/image is the full path to the place that the file should reside in the resulting image.  You do not have to create the directory hierarchy, docker will create it if it does not exist. The name of the file in the image does NOT have to be the same as the name of the file_in_build_context.  So, if you have the following directory structure for your image:
build_context/
              Dockerfile
              file.txt
              config/config_file.yml

You would add file.txt to /etc/bashrc with
```
ADD file.txt /etc/bashrc
```

Files added in this way will be a permenant part of the image, and the size of the resulting image will be impacted by the size of files added to it. You can use these files in the rest of your build context, or they can be available as configuration for the application(s) that are in your images.

#### `RUN command argument argument ...`

`RUN ["command", "argument", "argument"]`

The RUN command runs a command, with optional arguments, on the image when it is being built, and causes any changes made by running the command to become a permanent part of the image.  As you can see, there are two syntaxes for RUN, but they tend to behave the same.

#### `WORKDIR /path/to/directory`

This command tells docker to change the current working directory to the specified path.  Subsequent RUN commands will run relative to this directory.  Also, any ENTRYPOINT or CMD (see below) will run relative to this directory, and any command run agaist the image using the docker run syntax will run relative to this directory, unless the WORKDIR is overridden in the docker run command.

#### `CMD command argument argument ...`

CMD is different from RUN. Normally (see ENTRYPOINT) it is the default command (and optional arguments) that will be executed in any container that is run from the resulting image.  For this reason, there should only be one CMD in your Dockerfile (if you put more than one, the last one that you put in the file will override all previous ones).  It can also be used to override any CMD that exists in any of the parent images from which your image starts FROM.  You can override the CMD for an image by passing an explicit command to run using the docker run syntax, e.g., if you have Dockerfile
```
FROM ubuntu:trusty
CMD ["echo", "hello world"]
```

The following will print out "hello world"
```bash
$ docker run helloworld
```
and the following will put you into a bash shell
```bash
$ docker run -ti helloworld bash
```
In this example, the bash command has overridden the default echo hello world command.

#### `ENTRYPOINT command`

ENTRYPOINT is like command, in that it specifies a command to be run any time the image is run as a container.  It is different from CMD in important ways:
 - it should not have arguments (this allows you to specify default arguments with a CMD).
 - it is harder to override at run time
When an ENTRYPOINT is defined in a Dockerfile, CMD changes its behavior.  Instead of specifying a default command to run, it specifies a default set of commandline arguments to pass to the command specified by the ENTRYPOINT. These can be changed at run time in the same way that any CMD can be changed.

Given the Dockerfile
```
FROM ubuntu:trusty
ENTRYPOINT echo
CMD ["hello world"]
```

The following would echo hello world:
```bash
$ docker run helloworld
```
The following would echo 'bash'
```bash
$ docker run -ti helloworld bash
```

Resources
---------
* [building docker images](https://docs.docker.com/reference/commandline/cli/#build)
* [Dockerfile](https://docs.docker.com/reference/builder/)
