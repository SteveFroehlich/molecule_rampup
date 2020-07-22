# Exercise 2 Elastic Search

Here we have an existing ansible role called `elastic_search`. Its `main.yml`
found [here](elastic_search_role/tasks/main.yml) deploys a two node 
elastic search cluster on a single machine and checks it can connect
to the cluster once up. The `molecule/` directory is already created
along with code to run a `molecule converge`. 

The task is to look at the elastic search [docs](https://www.elastic.co/guide/en/elasticsearch/reference/current/getting-started-install.html) 
and see what other tests one should have to verify the role works correctly
in addition to the simple http check within the role. For more information
take a look at the verify portion of the molecule [scenario layout](https://molecule.readthedocs.io/en/latest/getting-started.html#the-scenario-layout)
