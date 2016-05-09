Local git exercises
-------------------

- Create a ~/.gitconfig file with our [example](https://github.com/rvosa/arangs2016/blob/master/docs/2016-05-09/git/example_gitconfig) _i.e. create an invisible file in your home directory, paste the example into it and enter your name and email address in the appropriate location_
- Clone your personal instance of our repository onto your machine, choose the SSH clone url
- Use git to show information about the commit history for the project
- Show information about files changed during the commits
- Show information about files changed, with the status of each change for
commit 4c4ff5ece4c3132c6fa29f3e826e3272686c78e0 (try 4c4ff5ece4)
- Add a file to the repository (use your favorite text editor)
- Use `git status` to find out the state of the repository
- Try `git status --porcelain`
- What if you didnt like this file, how could you get rid of it (dont do it)?
- Stage this file change
- What do git status, and `git status --porcelain` show
- How could you get rid of this file now? Go ahead and fully delete the file.
- Create a new file, and make sure it gets committed to the repository
- What remote git repositories does your git repository know about?
- Push your new changes to the file up to your github repository
- Find the newly committed file in your github repository.  Edit it using
Github and make a change.
- Go back to the commandline and use git to `pull` these changes
- Unix `rm` the file you created.
- What do `git status` and `git status --porcelain` show?
- Can you get it back?
- `rm` it again, then stage the removal.
- Get it back again
- `git rm` the file.  How is this different than using unix `rm`?
- Commit the removal of the file, and push the changes up to Github
- Use the Github Web interface to inspect changes for this file.  Can you
still find the contents of the file in Github?  Do you think it is a
good idea to store usernames and passwords in publicly available GitHub accounts?
- Edit one of the files, but do not add the changes.  Create a branch called 'try_bowtie'.  Use git status to find out the state of the repo.  Add and commit
your changes to the branch.  Use git to find out all the branches you have made (you might see branches pulled in when you forked the repository from someone else).  Change to the master branch.  Use git status to find out the state of the repository.  Can you find your changes?  Switch back to the 'try_bowtie' branch.  Can you find your changes now?  Switch back to the master branch.  Merge try_bowtie in to the master branch.  Use git status to find the status of the master branch. Commit and push these changes to Github.  Use the Github web interface to find out if the branch was pushed. Remove the 'try_bowtie' branch from your repository.
