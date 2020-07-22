# Introduction to Molecule 
This document introduces the reader to molecule, the core concepts and has exercises of increasing complexity. It provides one possible road map to understanding and using molecule. 
### Assumptions
This assumes ansible is installed locally. If it is not, one way is to install via pip:
```
pip install ansible
```
Note many people will do this inside a [virtual environment](https://docs.python.org/3/tutorial/venv.html)
to isolate projects, or you can use a tool like [pipenv](https://pipenv.pypa.io/en/latest/)
that bundles pip and virtualenv. Once installed verify the the install with 
```
$ ansible --version
```
Which should display the version.

# Molecule
This lesson will start with the basic walk through [here](https://molecule.readthedocs.io/en/latest/getting-started.html#run-test-sequence-commands).
Which outlines the steps to get a simple example running. 

### Create an EC2 instance 
We run this example on an AWS EC2 instance so we can provide a consistent experience
for different users. If you have never created an EC2 instance before you can follow [these](https://docs.aws.amazon.com/efs/latest/ug/gs-step-one-create-ec2-resources.html)
steps. Use the Amazon Linux OS, you should use at least the micro instance 
which is AMI: ami-0323c3dd2da7fb37d, smaller instances might not have the 
resources to properly execute the code. You may also need to setup SSH access
using [this](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair).
After the box is provisioned copy the box ip so we can call ansible to
configure the instance.
 

### Configure the Instance
Now we should be able to setup the instance for this lesson via ansible playbook. 
Make sure you can connect to the EC2 instance via ssh:
```
ssh -i ~/.ssh/my-user.pem ec2-user@<instance-ip>
```
Exit the SSH shell. You are ready to setup molecule. Run the following command:
```
ansible-playbook -i hosts amazon_os_playbook.yml  -e ansible_host=<your-host-ip>
```
After this completes your instance should have molecule installed and ready to 
run tests. (If you notice the liberal use of the ansible shell module see 
the Note at the bottom of this page for an explanation)

# Concepts
Any existing ansible role can be tested by molecule by adding a molecule scenario.
A molecule scenario is a directory in the molecule directory (in this case 
named default/) with:
```
molecule/
└── default
    ├── INSTALL.rst
    ├── converge.yml
    ├── molecule.yml
    └── verify.yml
```
the above 4 files. Converge.yml defines what tasks are executed 
and verify defines the tests to run against the state created by
converge.yml. For more information see the official docs 
[here](https://molecule.readthedocs.io/en/latest/configuration.html#scenario)

Note the details of how molecule is setup for this lesson can be found [here](amazon_os_playbook.yml)
It is also worth noting the playbook is not written as you would write a production
level ansible playbook. It uses shell to explicitly run commands so its easier 
to see the commands to setup molecule. In an actual production system you should use
the corresponding modules 

# Exercises
* **[Exercise 1: update a file (hello world example)](course/exercise1.md)**
* **[Exercise 2: web app](course/exercise2.md)**
* **[Exercise 3: elastic search](course/exercise3.md)**

