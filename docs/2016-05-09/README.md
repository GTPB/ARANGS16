![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS16
========
Introduction, Installation, Git and Github 101 
----------------------------------------------
*2016-05-09*

Computationally intensive research, such as genome assembly or other types of analyses in
Next Generation Sequencing, ought to be reproducible so that other researchers can verify
results and build on them. This is hampered by the fact that analysis pipelines often
depend on numerous, hard-to-install programs that each have different versions and that 
can be parameterized with a variety of settings. It is therefore no good if we describe 
our research methods simply as "we used `foo` (Smith, 2013) and `bar` (Jones, 2014)".

Our entire research environment, with all the tools and data that we use and how we use 
them, should be fully described in machine-readable configuration and executable files. 
In turn, these files should be fully versioned so that there is no ambiguity about what 
version is used. To manage that we will use a system that originates in the Linux 
community, `git`, which tracks the history of text files (in any syntax format) in public,
such that different people can collaborate on the same files.

Many different providers host `git` repositories. The most popular one, which has the best
features for collaboration, is Github. Today we will dive into `git` and Github, to 
accomplish the following learning goals:

- The open source culture and github
- Course Github repositories
- Forking our repositories to make your own copy
- Cloning repositories
- Local and remote repositories
- Using forks as a proxy for 'citations' of code
- Following our repositories
- Pulling changes from our repositories
- Submitting Pull Requests (sharing back)
- .gitignore and secrets
- The Git Workflow

Schedule
--------

### Session 1: Introductions. 

Expectation management: what do we expect from the course, what could be 
added/changed/removed, are we all technically ready for this? How will we teach the 
course, how will we work together, how to provide feedback?

We will explore the [course repository](https://github.com/rvosa/arangs2016) on the web and 
explain how it works. We will then dive into the 
[github folder](https://github.com/rvosa/arangs2016/tree/master/docs/2016-05-09/github) of 
the course repository where we will a worksheet with assignments (so, do these), and another
README file with more background information.

### Session 2: Using git and github locally.

In the previous session we dipped our toes into github but we didn't really look at the
possibilities locally on the command line. In this session we will do the exercises
in the [git folder](https://github.com/rvosa/arangs2016/tree/master/docs/2016-05-09/git).

### Session 3: Setting up a simple pipeline. 

We will look at a 
[pipeline](https://github.com/rvosa/arangs2016/blob/master/bin/pipeline.sh) in shell 
script that maps short reads against a reference genome. If we are comfortable with Linux 
shell commands we should be able to understand what the pipeline does. Go into the
[local install](https://github.com/rvosa/arangs2016/tree/master/docs/2016-05-09/local_install)
folder and do the assignments in the worksheet.

### Session 4: First run of the pipeline. 
 
If all tools were installed correctly and the data are there we should be able to run the 
pipeline. If there are any bugs in the pipeline whose fix the whole class benefits from, 
commit your corrections to your repository and submit a pull request. To view the produced 
alignments you can use (for example) [igv](http://www.broadinstitute.org/igv/). (There are
no assignments: there are probably enough loose ends to deal with anyway before we adjourn.)
