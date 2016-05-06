Launching a tiny Linux with Vagrant
===================================

- Install [vagrant](http://vagrantup.com).
- Have a look at the available [vagrant boxes](https://atlas.hashicorp.com/boxes/search)
- Search for a `tiny` box for the provider `virtualbox`
- Click on the search result. There should be an instruction for how to initialize the box in a `fixed width font`
- Create a new folder in the terminal and navigate into it. Then run the initialization command.
- There should now be a file called `Vagrantfile`. Open it in a text editor.
- Assign more RAM (2048) to the VM by editing the Vagrantfile.
- Turn on the GUI 
- This box does not use `bash`, it uses `sh`. Specify this in the Vagrantfile using `config.ssh.shell="sh"`
- When you're done configuring the Vagrantfile, save it, then launch the VM with `vagrant up`
- There might be some error messages where it tries to "mount" folders. If you wait long enough it'll give up - it's not a problem.
