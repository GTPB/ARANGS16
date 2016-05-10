Mindmapping
-----------

These exercises are actually as much about mind mapping as they are about
getting files to end up in git repositories upstream. Previously we learned
how to go in the opposite direction, i.e. to merge changes made upstream in the 
`rvosa/arangs2016` repository into your local fork. Now we're going to merge
your local changes into the upstream repository. We do this using a "pull
request". The idea here is that you send me (Rutger) a suggested state for the
repository to be in, namely one that includes your newly created mind map file.
In order for this to be as painless as possible we want to avoid having to 
resolve a lot of conflicts, hence your repository must be as close as possible
to the state of the upstream repository, which means you should first merge
the recent changes I made in the upstream repository into your own repo, and
then create a pull request based on that state + your mind map. Here are the
steps:

- Create a mind map to summarize what we did yesterday (i.e., attempt to understand Vagrant) using XMind
- Give your mind map a name that _includes_ the name of your computer, i.e. `t1`,
  `t2`, `t3`, whatever. You can find out what the name is of your computer by
  looking in the terminal: it should show `participant@t*`. Why do you think we
  want the file name to include the computer name?
- [Merge the upstream changes into your repo](https://github.com/rvosa/arangs2016/tree/master/docs/2016-05-09/git#merging-from-an-upstream-repository)
- Place your mind map file in the folder `~/arangs2016/docs/2016-05-11/mindmap`
- Add the file to your repo (`git add ~/arangs2016/docs/2016-05-11/mindmap/*.xmind`)
- Commit it (`git commit -m "mind map of <my name>" ~/arangs2016/docs/2016-05-11/mindmap/*.xmind`)
- Push it to your repo (`git push`)
- Go to the homepage of your repository on GitHub
- Click the button "New pull request". My repo is the "base fork", you are the "head fork", and
  we are only comparing the master branches.
