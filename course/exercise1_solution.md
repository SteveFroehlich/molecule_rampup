**Solution**

First update the test_role/tasks/main.yml to create a directory by adding
```
- name: Create a directory if it does not exist
  file:
    path: /etc/some_directory
    state: directory
```

Second write a test to verify if directory was created. To do that
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


