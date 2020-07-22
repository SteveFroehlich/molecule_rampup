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


