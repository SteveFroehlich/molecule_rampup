# Exercise 2 Elastic Search

Here we have an existing ansible role called `elastic_search`. Its `main.yml`
only has these contents:
```
- name: Molecule Hello World!
  copy:
    src: hello_world.txt
    dest: /tmp/hello_world.txt
```
which copies a file to the target machine. The task is to use molecule
to test this role.