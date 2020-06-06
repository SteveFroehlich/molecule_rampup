# Introduction to Molecule 

### Assumptions
Ansible is installed locally. If it is not, one way is to install via pip:
```
pip install ansible
```
Then verify the the install with 
```
$ ansible --version
```
Which should display the version.

# Molecule
This lesson will go through the basic walk through [here](https://molecule.readthedocs.io/en/latest/getting-started.html#run-test-sequence-commands).
Which outline the steps to get a simple example running. First the lesson uses ansible
so that should be installed locally (see steps above). 

### Create an EC2 instance 
We run this example on an AWS EC2 instance so we can provide a consistent experience
for different users. If you have never created an EC2 instance before you can follow these [steps](https://docs.aws.amazon.com/efs/latest/ug/gs-step-one-create-ec2-resources.html).
Use the Amazon Linux OS, you should use at least the micro instance 
which is AMI: ami-0323c3dd2da7fb37d, smaller instances might not have the 
resources to properly run execute the code. You may also need to setup SSH access
using [this](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair).
After the box is provisioned copy the box ip so we can 
configure the instance.
 

### Configure the Instance
Now we should be able to setup the instance for this lesson via ansible playbook. 
Mae sure you can connect to the instance via ssh:
```
ssh -i ~/.ssh/my-user.pem ec2-user@<instance-ip>
```
Exit the SSH shell. You are ready to setup molecule. Run the following command:
```
ansible-playbook -i hosts amazon_os_playbook.yml  -e ansible_host=<your-host-ip>
```
After this completes your instance should have molecule installed and ready to 
run tests.

## Problem set #1
**Tasks**

First update the test_role/tasks/main.yml to create a directory by adding
```
- name: Create a directory if it does not exist
  file:
    path: /etc/some_directory
    state: directory
```
to `tasks/main.yml`

Second update the verify logic to check if directory was created
```
  - name: Ansible check file exists.
    stat:
      path: /etc/some_directory
    register: file_details

  - name: Example assertion
    assert:
      that: files_to_delete.stat.exists
```

Once the files are updated you can run the full test via:
```
ansible-playbook -i hosts amazon_os_playbook.yml  -e ansible_host=<your-host-ip> --tags molecule-test
```
Lastly if you want to see the test fail add
```  
- name: fail the test
    assert:
      that: False
```
to `verify.yml`

## Problem Set 2 Web App
Now that we can test our role, lets update the role to have it do 
something a little more interesting. Lets deploy and start a [Flask](https://www.fullstackpython.com/flask.html)
web app. To do that we need to update the role under test `test_role`
to have the logic to deploy flask. I encourage the reader to try to
follow the steps [here](https://flask.palletsprojects.com/en/1.1.x/installation/)
and update the role to do it (A solution is provided later to check against).
Once that is done we need to update the verify.yml to add new tests to make sure
the role did what is was suppose to. So let do that.

By default Flask will start on port 5000 so a good way to test our app is up is
to make an HTTP request to that port succeeds. Again I encourage the reader
to try before they take the solution below.

Here is one way to test the flask app is up and healthy. 
```
molecule login # login to the docker container
# below should to into tasks/main.yml
sudo pip install Flask
```
Create `app.py` with contents:

```
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```
update the env variable to let flask know about the app
```
export FLASK_APP=hello.py
# run
nohup flask run &
```

# Concepts
Molecule Scenario is a directory in the molecule directory with:
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
converge.yml. For more information see the official docs [here](https://molecule.readthedocs.io/en/latest/configuration.html#scenario)

Note the details of how molecule is setup for this lesson can be found [here](amazon_os_playbook.yml)

