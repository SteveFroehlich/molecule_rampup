# Introduction to Molecule 

### Assumptions
This assumes ansible is installed locally. If it is not, one way is to install via pip:
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
Which outline the steps to get a simple example running. 

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
Mae sure you can connect to the EC2 instance via ssh:
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

## Exercise #1
Write a task to create a directory and test it using molecule. The
reader is encouraged to try on their own before they look at the 
solution below.

**Solution**

First update the test_role/tasks/main.yml to create a directory by adding
```
- name: Create a directory if it does not exist
  file:
    path: /etc/some_directory
    state: directory
```

Second update the verify logic to check if directory was created. To do that
add the below to test_role/molecule/default/verify.yml.
```
  - name: Ansible check file exists.
    stat:
      path: /etc/some_directory
    register: file_details

  - name: Example assertion
    assert:
      that: file_details.stat.exists
```

Once the files on the remote box are updated you can run the full test:

1. From the test_role/ directory on the remote box. 
```
molecule test
```
or 2. via ansible locally with:
```
ansible-playbook -i hosts amazon_os_playbook.yml  -e ansible_host=<your-host-ip> --tags molecule-test
```
Lastly if you want to see the test fail add
```  
- name: fail the test
    assert:
      that: False
```
to `verify.yml`. To view a full solution see `test_role_sol_1.tar.gz`.

## Exercise 2 Web App
Now that we can test our role, lets update the role to have it do 
something a little more interesting. Lets deploy and start a [Flask](https://www.fullstackpython.com/flask.html)
web app. To do that we need to update the role under test `test_role`
to have the logic to deploy flask. I encourage the reader to try to
follow the steps [here](https://flask.palletsprojects.com/en/1.1.x/installation/)
and update the role to do it.
Once that is done we need to update the verify.yml to add new tests to make sure
the role did what is was suppose to. So let do that.

By default Flask will start on port 5000 so a good way to test our app is up is
to verify an HTTP request to that port succeeds. Again I encourage the reader
to try before they take the solution below.

Here is one way to setup and test the flask app. Create `app.py` with contents:
```
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```
and add it to the files/ directory in the test_role. Add the following to the 
`tasks/main.yml` to copy the app.py over to the instance:
```
- name: copy flask app to instance
  copy: 
    src: app.py
    dest: /home/app.py
```
Update the env variable to let flask know about the app by adding the below to
`tasks/main.yml`:
```
- name: install Flask
  shell: "sudo pip install Flask"

- name: "run the Flask app on localhost:5000"
  shell: "export FLASK_APP=hello.py; nohup flask run &"
```
Now we need to update the verify.yml to add the verification logic. Add:
```
- name: get flask info
  shell: "flask --version"
  register: flask_version

- name: assert Flask is installed
  failed_when: "'Flask' not in this.content"
```
To verify Flask is installed. And add:
```
  uri:
    url: http://127.0.0.1:5000
    return_content: yes
  register: this
  failed_when: "'Hello' not in this.content"
```
To verify the web app resonds on port 5000.
No we can run the test, either on the instance run `molecule test` 
from the test_role/ directory. Or you can run molecule test from the playbook
with:
```
ansible-playbook -i hosts amazon_os_playbook.yml --tags molecule-test -e ansible_host=54.209.251.184 
```

If you want to check your changes against a tested solution you can 
unarchive `test_role_sol_2.tar.gz`.

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
level ansible playbook. It uses shell to explicitly run commands so its easier for 
users to learn how to setup molecule. In an actual production system you should use
the corresponding modules 
