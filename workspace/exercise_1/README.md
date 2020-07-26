# Exercise 1. Run converge on a role.

In this directory we have an existing ansible role 
called `simple_role`. Its `main.yml` only has these contents:
```
- name: Molecule Hello World!
  copy:
    src: hello_world.txt
    dest: /tmp/hello_world.txt
```
which copies a file to the target machine. The task is to use molecule
to test this role can run successfully. Take a look at the [molecule docs](https://molecule.readthedocs.io/en/latest/getting-started.html)
to see what to add to allow molecule to execute the role.

If you have trouble getting it working you can look at the solution.
```
git diff exercise-1 exercise-1-solution
```
