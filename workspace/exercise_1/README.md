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

Once you made your changes either
1. run the `run_exercise_1_in_ec2.sh` script if you chose the EC2 path
2. checkout branch exercise_1, commit and push your changes if you 
   chose the git actions path

If you have trouble getting it working you can look at the solution.
By running the below command in this directory
```
git diff exercise_1 solution -- simple_role/
```
