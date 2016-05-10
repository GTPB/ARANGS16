Launching a tiny Linux by hand on Virtualbox
============================================

- Download the [SliTaz](http://www.slitaz.org/en/get/) ISO and launch it as a LiveCD in VirtualBox (no virtual drive needed)
- In Virtualbox, look at the different ways to end the SliTaz process. What are the differences between "pause", "save state" and "power off"? _"power off" is a complete shutdown, the others are sleep without or with a snapshot taken_ In what state are you able to change the system settings of the VM? _"power off"_
- How much RAM is assigned by Virtualbox to the VM? _256MB_ By how much can you increase that "in the green"? _~10GB_
- How many processors are assigned? _1_ By how much can this be increased? _up to 4_
- In SliTaz, what package manager does this Linux distribution use? _tazpkg_
- Would you be able to compile from source on this VM in its current state? _there appear to be no build tools_
- What tools would you look for to check if you can compile from source? _e.g. make, gcc, etc._
- Is git installed? _no. To install git:_
```bash
    $ su # password root
    $ tazpkg get-install git
```
