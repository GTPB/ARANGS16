docker-compose
--------------

- Have a look at [this YAML file](https://github.com/rvosa/arangs2016/blob/master/conf/docker/docker-compose.yml).
- How many build contexts are there? _2, because the services gzip and samtools have the same build context_
- Where are the build contexts relative to the YAML file? _The YAML is in the conf/docker folder of the repo, the build contexts are below it_
- If you do a docker-compose build from this YAML file, how many Docker images will be created? _4_
- Why does line 4 start with a dash `-`? What does this mean in YAML syntax (look it up)? How would the 
  equivalent concept be expressed in JSON? What does this imply about the `volumes` setting? _Lines prefixed with a dash are list elements. This is equivalent to a comma separated list inside square brackets in JSON. The implication is that you can mount multiple volumes._
- How many different syntaxes/notations have we so far looked at this week? _Ruby, Shell, YAML, Docker, JSON, Markdown, make_
- If you run one of these containers inside home (`~/`), would your invisible `.ssh` directory be accessible in the container? 
  By which path would it be reachable in the container? _Home becomes /wdir, so the container has access to /wdir/.ssh/id\_rsa_
- Have a look at [the other YAML file](https://github.com/rvosa/arangs2016/blob/master/conf/docker/docker-compose-data.yml)
- How many build contexts does it have? _3, the gzip service does not have a distinct build context, just another entry point_ Do they all build tools, or is something else going on? _One creates a shared data volume and populates it_ Would all build targets be able
  to have an entry point, and how would that work? _I don't think the data service could have an entry point as it is not an executable._
- What do you think the `volumes_from` directive does? _It mounts a volume provided by another service._

<!-- https://docs.docker.com/compose/compose-file/#volumes-from -->
