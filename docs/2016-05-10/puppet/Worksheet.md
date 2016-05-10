Launching and provisioning a usable Linux with Vagrant and Puppet
=================================================================

![tahr](http://www.exclusiveadventuresnz.com/images/hunting/big-game/bull-tahr/bull-tahr-banner1.jpg)

- Have a look at this edited [Vagrantfile](https://github.com/rvosa/arangs2016/blob/master/conf/vagrant/Vagrantfile)
- Which Linux distribution is specified in this file? _The file specifies [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64), which corresponds with Ubuntu 14.04 LTS "Trusty Tahr"_ 
- Can you find this distribution in the [vagrant cloud](https://atlas.hashicorp.com/boxes/search)? 
- Is this a common distribution? 
- How does it compare to the operating system of your host desktop? 
- Are there likely to be Virtualbox guest additions for this distribution?
- Provisioning is the process of installing and configuring additional tools on a base OS. Before lunch we saw an
example of provisioning using shell commands in the Vagrantfile. Which provisioner is used in this edited Vagrantfile?
- Install `puppet` using the following commands:

```
    wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    sudo dpkg -i puppetlabs-release-trusty.deb
    sudo apt-get update
    sudo apt-get -y install puppet
```

- Now have a look at [this provisioning script](https://github.com/rvosa/arangs2016/blob/master/conf/vagrant/manifests/default.pp).
- What would the instructions after `dl_bwa` (line 35) do?
- What immediately preceding steps does `untar_bwa` require?
- What is the Current Working Directory (`cwd`) where BWA is unzipped?
- What is the function of `symlink_bwa`? What other methods could be used to achieve the same effect (think of `$PATH`)
- Do a test run of the provisioning script. If you do it as follows, nothing will be installed yet:

 `puppet apply --noop default.pp`

- Now try to add another install command to the provisioning script. Make the command clone the course github repo 
(`git clone`). Make this happen in the home directory of the vagrant user (`cwd` should specify this). Make sure that
the for this step required package `git` is already installed. Specify the name of the folder that will be created.
