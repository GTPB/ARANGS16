Launching and provisioning a usable Linux with Vagrant and Puppet
=================================================================

![tahr](http://www.exclusiveadventuresnz.com/images/hunting/big-game/bull-tahr/bull-tahr-banner1.jpg)

- Have a look at this edited [Vagrantfile](https://github.com/rvosa/arangs2016/blob/master/conf/vagrant/Vagrantfile)
- Which Linux distribution is specified in this file? _The file specifies [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64), which corresponds with Ubuntu 14.04 LTS "Trusty Tahr"_ 
- Can you find this distribution in the [vagrant cloud](https://atlas.hashicorp.com/boxes/search)? _Yes, [here](https://atlas.hashicorp.com/ubuntu/boxes/trusty64)_
- Is this a common distribution? _The commonest: it is the first result in the vagrant cloud and has been downloaded more than 15 million times_
- How does it compare to the operating system of your host desktop? _It is the same_
- Are there likely to be Virtualbox guest additions for this distribution? _"Guest additions" are provided by Virtualbox to give a smoother user experience, for example by adding the ability to have shared folders between guest and host, to have the screen resolution of the guest match that of the host, and so on. Given that `trusty64` is the most common box, it is likely that this additional functionality has been developed and is available._
- Provisioning is the process of installing and configuring additional tools on a base OS. Before lunch we saw an
example of provisioning using shell commands in the Vagrantfile. Which provisioner is used in this edited Vagrantfile? _puppet_
- Install `puppet` using the following commands:

```
    wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    sudo dpkg -i puppetlabs-release-trusty.deb
    sudo apt-get update
    sudo apt-get -y install puppet
```

- Now have a look at [this provisioning script](https://github.com/rvosa/arangs2016/blob/master/conf/vagrant/manifests/default.pp).
- What would the instructions after `dl_bwa` (line 35) do? _Download bwa_
- What immediately preceding steps does `untar_bwa` require? _bwa needs to be unzipped, and the `tar` package needs to be installed. These are the `require` statements on line 49._ 
- What is the Current Working Directory (`cwd`) where BWA is unzipped? _/usr/local/src_
- What is the function of `symlink_bwa`? What other methods could be used to achieve the same effect (think of `$PATH`) _This creates a symbolic link (i.e. a shortcut) into /usr/local/bin, which is one of the places where the OS looks for executables. Another option would have been to update the `$PATH` variable to include the folder that contains bwa_
- Do a test run of the provisioning script. If you do it as follows, nothing will be installed yet:

 `puppet apply --noop default.pp`

- Now try to add another install command to the provisioning script. Make the command clone the course github repo 
  (`git clone`). Make this happen in the home directory of the vagrant user (`cwd` should specify this). Make sure that
  the for this step required package `git` is already installed. Specify the name of the folder that will be created.
- Once you are confident that the syntax is correct (`puppet apply --noop default.pp` will tell you this), go into the
  `arangs2016/conf` folder and run `vagrant up`. If you get a message that the machine was already provisioned, you can rerun the provisioner using `vagrant provision`. **So, provisioning is done by the host, on the guest!** Then, go into the VM using `vagrant ssh`.
