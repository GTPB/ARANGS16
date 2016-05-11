Containerizing 
--------------
We are going to try to get `bwa` and `samtools` to run as docker applications.
The end goal here is that we can run the modified pipeline.sh on the host
such that it invokes `docker run [IMAGE] bwa [ARGUMENTS]` and 
`docker run [IMAGE] samtools [ARGUMENTS]`. Hence, the steps would be
something like:

- pick a base image that makes sense, such as ubuntu:trusty, and log in on it
- install any packages that are missing before you can compile. On ubuntu
  this would be `build-essential`
- make sure your container has access to the unpacked source folders for bwa/samtools
- you should now be able to run `make` inside the container, and copy the
  resulting binary to somewhere in the path of the container.
- modify the pipeline.sh so that it invokes `docker run ...` rather than bwa/samtools
  directly. 
