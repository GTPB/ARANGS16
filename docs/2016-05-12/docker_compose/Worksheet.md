docker-compose
--------------

- Have a look at [this yml file](https://github.com/rvosa/arangs2016/blob/master/docker-compose.yml)
- How many build contexts are there?
- Where are the build contexts relative to the YAML file?
- Why does line 4 start with a hyphen? What does this mean in YAML syntax (look it up)? What does this imply about volumes?
- If you run one of these containers inside home (`~/`), would your invisible `.ssh` directory be accessible in the container? 
  By which path would it be reachable in the container?
- Have a look at [the other yaml file](https://github.com/rvosa/arangs2016/blob/master/docker-compose-data.yml)
- How many build contexts does it have? Do they all build tools, or is something else going on? Would all build contexts be able
  to have an entry point, and how would that work?
- What do you think the `volumes_from` directive does? 

<!-- https://docs.docker.com/compose/compose-file/#volumes-from -->
