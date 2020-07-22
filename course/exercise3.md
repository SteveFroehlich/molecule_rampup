# Exercise 3 Elastic Search
Elastic search is a distributed search engine. To learn more about 
elastic search you can visit their [site](https://www.elastic.co/elasticsearch/)
or view the code on [github](https://github.com/elastic/elasticsearch)

Elastic search has an [ansible role](https://github.com/elastic/ansible-elasticsearch) 
that is not tested with molecule. So
in this exercise we are going to convert the role to use molecule. This
will provide a good real world example of using molecule.

The directory structure of the role (as of commit [adbec9d](https://github.com/elastic/ansible-elasticsearch/commit/adbec9db3fd8074804a6d66b5d0a3c80f4c5fe3b))
looks like [this](role_dir_structure.md) For more details see `files/ansible-elasticsearch/`
From the [role readme](../files/ansible-elasticsearch/README.md) we see that by default
this role will start a single node elastic search instance. So how would we test this?


### Verification
One easy validation to test this role, is to check that after it executes we can connect to 
the running elastic search instance. We can do that by
running the following commands on the machine running elastic search.
To check the node is up we can run:
```
curl http://localhost:9201
```

A second validation we can do is to check the health of the (single node) cluster: 
```
curl -XGET 'http://localhost:9201/_cat/health?pretty'
```

### Adding Molecule
In order to add molecule to this role we need to add a molecule directory
and a few files that define how molecule and the tests should behave. Molecule 
needs to have one default scenario that verifies the default or main way the 
role was intended to be used. So we need a directory named default to
denote that. 
```
molecule/
└── default/
```
a detailed description of the needed files can be found in the [docs](https://molecule.readthedocs.io/en/2.22/getting-started.html#the-scenario-layout)
Try adding the files to run molecule and add the two verifications above.