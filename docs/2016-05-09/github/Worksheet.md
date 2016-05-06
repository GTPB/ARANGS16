GitHub Worksheet
================

* Create your personal Github Account
* Find the `arangs2016` repository
  - Does it have an Open Source License?
  - Who Owns the Repository?
  - How many people have forked the repository?
  - How many contributors are working on this repository?
  - Who are they?
  - How many commits have been made?
  - Who made the latest commit?
* Take a look at the data directory.
  - Where did we get the data that we analyzed for our pipeline?
  - Do we make it easy for you to download the same data that we used?
* Go back to the bin directory
  - What is consistently found in each directory?
  - View the pipeline.sh file
  - View it in raw mode
  - Who can you blame for this file?
  - What is its history?
* Go back to the repository root
  - What is the git clone url for the repository?
    https https://github.com/dmlond/arangs2015.git
    ssh git@github.com:dmlond/arangs2015.git
    (Use the ssh one to push stuff back!)
* Fork our Repository
* Check to make sure the `git` executable is available. If not, install it, e.g. `sudo yum install git`
* [Create an SSH key](https://help.github.com/articles/generating-ssh-keys/) so that you can commit and `push` changes back to your repository.
```bash
$ ssh-keygen -t rsa
```
* [Merge the changes made upstream into your local fork](https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/)
