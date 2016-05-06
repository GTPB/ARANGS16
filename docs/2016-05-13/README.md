![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS16
========
Sharing automated, reproducible NGS analyses
--------------------------------------------
*2016-05-13*

On this last day we will tie it all together and practice how to share our analysis
environments with each other and the world. We have looked at `git` and Github as a way
to track and share the entire history of text files and projects. We have looked at
virtualization as a way to run controlled environments on host computers. We have looked
at `puppet` as a way to specify additional dependencies to be installed on a VM, and at
Vagrant as a way to combine downloading, provisioning and launching virtual machines. We
have therefore learnt that one way to share an analysis environment is using a Vagrantfile
and a puppet manifest.

Subsequently, we discovered that a more efficient way to run controlled environments is
by using `docker`. We saw that docker images can be composed from other images,
and that the full specification of this process is contained in a Dockerfile.

During this week we have run a simple analysis pipeline in a number of different
environments, starting from a poorly controlled, hard to reproduce situation where tools
and data are installed by hand on operating systems that each may have their own quirks.
We then moved towards more controlled situations.

Finally, now, we will look at convenient ways to share our analysis environments. For
vagrant there is a list of boxes that is managed on Github (pull requests are welcome)
that is hosted on the domain [vagrantbox.es](http://www.vagrantbox.es/). However, a more
complete solution, that includes packaging and hosting, is provided by
[Atlas](https://atlas.hashicorp.com/) (previously known as vagrantcloud.com).

For Docker images there is similar functionality provided by
[Docker hub](https://hub.docker.com): hosting of images, including even a facility
to search useful images using `docker search`. You can even host your own images for free!
We will see how Docker hub and Github can be integrated such that new builds of a docker image
can be triggered from within Github.

Last, we will have a look at [Kitematic](https://kitematic.com/), a convenient software for
searching, downloading and managing public Docker images hub and for running containers.

Schedule
--------

### Session 1: Vagrant in the cloud
We will explore repositories for web-hosted vagrant boxes
and push our own vagrant box to [Atlas](https://atlas.hashicorp.com/).
This way, you can share your own analysis environment with the world.

### Session 2: Docker in the cloud and automated builds
We will push a Docker image to [Docker hub](https://hub.docker.com)/[Docker cloud](https://cloud.docker.com)
and explore the possibilities of building images remotely (on the Docker hub servers).
After succeeding to run a remote build from a remote Dockerfile, we will try
different possibilities of triggering remote builds, e.g. via commits or version
releases in a Git hub repository.

### Session 3: Kitematic
The goal is to get aquainted with the [Kitematic](https://kitematic.com/) software,
an 'App store' for downloading and running public Docker images. We will run a docker container from
our remote image and will discuss
benefits and limitations of this GUI version of Docker.

### Session 4: Wrap-up
We will discuss how your research can profit from generating reproducible workflows
with virtualization software. To what extent will you use the tools that
you were introduced to in the last week? Which programs do you feel most comfortable
with? How can you structure joint projects with colleagues to make collaboration efficient?
