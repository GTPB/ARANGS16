Launching a tiny Linux with Vagrant
===================================

- Install [vagrant](http://vagrantup.com).
- Have a look at the available [vagrant boxes](https://atlas.hashicorp.com/boxes/search)
- Search for a `tiny` box for the provider `virtualbox`
- Click on the search result. There should be an instruction for how to initialize the box in a `fixed width font`
- Go into the vagrant folder in the terminal. Then run the initialization command.
- There should now be a file called `Vagrantfile`. Open it in a text editor.
- Assign more RAM (2048) to the VM by editing the Vagrantfile.
- Turn on the GUI 
- This box does not use `bash`, it uses `sh`. Specify this in the Vagrantfile using `config.ssh.shell="sh"`
- When you're done configuring the Vagrantfile, save it, then launch the VM with `vagrant up`
- There might be some error messages where it tries to "mount" folders. If you wait long enough it'll give up - 
  it's not a problem. If it seems to hang when creating synced folders you can break out of this with Ctr+C, 
  and then log in on the VM using `vagrant ssh`. 
- This VM is again too minimal for us to do something useful with so feel free to destroy it (`vagrant destroy`).
