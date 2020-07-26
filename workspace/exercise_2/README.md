# Exercise 2. Verify Correctness of a Role

Here we have an existing ansible role called `elastic_search`. Its `main.yml`
found [here](elastic_search_role/tasks/main.yml) deploys a two node 
elastic search cluster on a single machine and checks it can connect
to the cluster once up. The `molecule/` directory is already created
along with code to run a `molecule converge`. 

The task is to look at the elastic search [docs](https://www.elastic.co/guide/en/elasticsearch/reference/current/getting-started-install.html) 
and see what other tests one should have to verify the role works correctly
in addition to the simple http check within the role. For more information
on verifications in molecule take a look at the verify portion of the molecule 
[scenario layout](https://molecule.readthedocs.io/en/latest/getting-started.html#the-scenario-layout)

After you have come up with some verifications add them so that
`molecule verify` will run them against the role. 

The reader is encouraged to come up with the elastic verifications
before looking at the [suggestions](end_point_suggestions.md) 

Once you made your changes either
1. run the `run_exercise_2_in_ec2.sh` script if you chose the EC2 path
2. checkout branch exercise_2, commit and push your changes if you 
   chose the git actions path
   
The solution to the suggest verifications can be viewed via
By running the below command in this directory
```
git diff exercise_2 solution -- .
```


