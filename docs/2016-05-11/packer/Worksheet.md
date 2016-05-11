Vagrant / Packer exercises
-------------------------
### Template file
* Have a look at the [packer template](https://github.com/rvosa/arangs2016/blob/master/conf/vagrant/template.json) file.
* What will be the name of our Vagrant box if we execute this file using packer?
* Which provisioning tools are specified? 
* What does the "shell" provisioner install and why?
* Where does the "puppet" provisioner get its instructions from?
* In what order would the provisioners have to be executed?
* How many different virtualization environments are we building for?
* Do you recognize any of the steps in `boot_command` from earlier?
* What OS are we using?

### Running packer
* Install the [packer](http://packer.io) program
* Navigate to your local version of the template and inspect it using `packer inspect template.json`
* Does inspecting the template confirm your answers from earlier?
* Try to validate the template (`packer validate template.json`). Is it valid?

There are two ways in which you can have packer build a Vagrant box:
 1. Using `packer push ...`, which sends the build process to a server
 2. Using `packer build ...`, which does it locally.

For `push` you need to have an account on a web service that requires you to contact a 
sales department where a human needs to respond (it's free, but still a hassle). The `atlas_name`
and `atlas_username` variables provide the credentials so that the server accepts the build. 

It is somewhat instructive to run `packer build`, i.e. to do it locally, because it will 
show you what is being downloaded in what order and how the virtual machine is being 
provisioned. On the other hand, this is somewhat time- and bandwidth consuming because
an Ubuntu image needs to be downloaded. Hence, be aware of this possibility but consider
carefully if this is something you actually want to do right now. (Maybe we should do it
centrally on the projector?)
