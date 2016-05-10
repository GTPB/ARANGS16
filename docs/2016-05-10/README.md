![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS16
========
Virtualization and provision with Virtualbox and puppet
-------------------------------------------------------
*2016-05-10*

#### Goals

With today's instructions and exercises we 
hope to accomplish the following learning goals:

- Download and install of Virtualbox, if needed
- Configuration of VMs using Virtualbox (memory, processors, networking)
- Launching, suspending, quitting, removing VMs
- Download and install Puppet, if needed
- Applying puppet manifests
- Writing simple puppet manifests
- Download and install Vagrant, if needed
- Adding / initializing a vagrant box
- Launching, suspending, quitting, removing boxes
- Logging into a box

#### Virtualization

On the previous day we learned how to track changes in, and collaborate on, text files 
using `git` and Github. We would now be able to share analysis scripts, configuration
files, and (small) data files. However, simply pointing other researchers to our text
files does not assure that they would end up running their analyses in the exact same 
environment, with the same tools (and their underlying libraries).

We can solve this problem by using virtualization. Recent advances in computing power and
architecture have made it possible to run additional operating systems ("guests", "Virtual
machines") inside the operating system that runs the computer (the "host"). Several 
different software packages allow host OSs to run guest VMs. The most popular of these in
the open source community is Virtualbox, which we will explore today.

#### Managed, scriptable virtualization using Vagrant

In principle we could download an image, start it as a VM in Virtualbox, log in on it, 
and then do all the configuration by hand, partly on the host and partly in the guest. 
This is cumbersome and error prone. It would be much more convenient if the specification
of the image and its configuration as a VM was standardized and scriptable. For example,
wouldn't it be great if the whole process we did previously could be captured in a script
that can be maintained in some kind of version control system? Yes, it would. Vagrant
is one of a number of systems that provide this functionality. We'll play around with this.

#### Provisioning

Virtualbox or Vagrant allow us to host VMs, so we could tell our collaborators to install 
a specific operating system (example: Ubuntu 14.04LTS) on it and run our scripts there. 
However, unless we specify an OS version that is specifically geared towards NGS analysis 
(example: BioLinux) there are going to be many missing tools. This brings us back to the 
situation where we have to say about these tools that "we used `foo` (Smith, 2013) and `bar` 
(Jones, 2014)". That's no good: these tools will have different versions, and they may 
need to be compiled (with which flags?).

We could re-invent the wheel and write shell scripts to download and install all the tools
needed, but there are better ways. `Puppet` is used by system administrators to bring new
servers up and running automatically: by running a "puppet manifest" (a kind of script or
configuration file) all the dependencies that are defined are verified and if any are 
missing they are installed using the instructions in the manifest. This process is called
"provisioning".

Schedule
--------

The outline for today is as follows:

### Session 1: Entry level virtualization. 
 
We will start with a brief recap of day 1 and deal with any outstanding issues. We will 
then dip our toes into using Virtualbox by installing a tiny Linux distribution on it. 
We're doing this as a throwaway example to see how virtualization works when we do it
"by hand" using VirtualBox. Do the [assignments](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-10/virtualization/Worksheet.md) in the virtualization folder.

### Session 2: Managing virtual machines using Vagrant. 

After having seen how to install and configure a Linux distribution by hand we will now learn 
how to use Vagrant to manage this. We will install another tiny Linux distribution, but this
time we will manage this process using Vagrant. Do the [assignments](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-10/vagrant/Worksheet.md)
in the vagrant folder.

### Session 3: Provisioning virtual machines using Puppet. 
 
We have now seen that downloading, configuring and launching the right virtual machine image 
for the right provided (i.e. VirtualBox, in our case) can be managed by Vagrant. The Vagrantfile
gives us the possibility of sharing the specification of our analytical environment. However,
this environment is a "fresh" installation of a Linux distribution, so any of the specialized
tools that we need to do our analyses are missing. The process of automatically installing all
missing tools is called "provisioning". There are different tools that can be invoked by
Vagrant to do this. A simple one is to use the UNIX shell directly, but we will use a slightly
smarter technology called Puppet (there are others, e.g. Chef and Ansible). Do the [assignments](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-10/puppet/Worksheet.md)
in the puppet folder.

### Session 4: Running the pipeline. 

Do a [git merge](https://github.com/rvosa/arangs2016/tree/master/docs/2016-05-09/git#merging-from-an-upstream-repository)
to get the most recent version of the Vagrantfile. Run it, i.e. some combination of `vagrant up`,
possibly another round of `vagrant provision` (to do the repo clone), followed by `vagrant ssh`.
If the course repo was successfully cloned into the VM by puppet we should be able to navigate 
into the repo folder and run our pipeline. 
- Have look at the ownership of the folder /home/vagrant/arangs2016. Who owns it and how did that
  happen? (`sudo puppet apply ...`)
- Which user are we when we log in on the vagrant box? (`whoami`)
- Change the user of the repository: `sudo chown -R vagrant arangs2016`
- Now have a look at `/vagrantdata`. What's that?
- Make our pipeline.sh inside the vagrant box point to it, clean up the folder (remove result files,
  keep the fasta and fastq.gz files) and then rerun the pipeline.
