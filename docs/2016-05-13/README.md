![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS16
========
Sharing automated, reproducible NGS analyses
--------------------------------------------
*2016-05-13*

On this last day we will review the concepts of autamating workflows with the
tools presented in this course. We will in particular compare the virtualization 
tools _Docker_ and _Vagrant_ and their advantages/disadvantages for particular problems.
After the coffe break, we will again do _hands-on_ training and extend the pipeline that we 
developed last week to include genotype calling.

### Docker vs. Vagrant

Docker  | Vagrant
--- | ---
lightweight | entire OS
linux dependent | standalone
requires `docker` | requires `docker` and `vagrant`
docker language | uses ruby
invoke tools from outside | log in on environment
  | deploy on grid
resource efficient  | less so due to virtualization
works on MPI cluster  | not so much
docker hub  | vagrant cloud

Schedule
--------

### Session 1: Docker recap
We will discuss on what we learned about the Docker technology.

### Session 2: Comparison of Vagrant and Docker
We will have an open discussion about when it is best to use which virtualization tool.
Input about your own expectations/requirements is very welcome.

### Session 3: Extending the pipeline
We will dive into our pipeline code again and extend the pipeline to include genotype calling. 
We will also work on a puppet manifest to virtualize Maker (see [here](https://github.com/rvosa/arangs2016/issues/10)).

### Session 4: Wrap-up
We will discuss how your research can profit from generating reproducible workflows
with virtualization software. To what extent will you use the tools that
you were introduced to in the last week? Which programs do you feel most comfortable
with? How can you structure joint projects with colleagues to make collaboration efficient?
