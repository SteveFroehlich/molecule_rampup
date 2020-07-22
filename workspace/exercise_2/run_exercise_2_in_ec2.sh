#!/bin/sh

# set env var with host.
# ie: $ export RAMPUP_HOST=3.80.86.160

SERVER=$RAMPUP_HOST
ROLE_DIR=elastic_search_role

if [ -z $SERVER ]; then
    echo '\n\nCould not find host. Make sure env var is set. ie: $ export RAMPUP_HOST=some.host.ip\n'
    exit 1
fi

echo ''
echo 'submitting changes to host ' $SERVER

rsync -avz $ROLE_DIR ec2-user@$SERVER:~/

echo 'changes successfully sync'd to server 
echo ''

cd ../../ec2_setup/
# echo 'running: ansible-playbook -i hosts amazon_os_playbook.yml --tags molecule-test -e ansible_host='$SERVER' -e molecule_cmd=converge -e role_under_test='$ROLE_DIR
ansible-playbook -i hosts amazon_os_playbook.yml --tags molecule-test -e ansible_host=$SERVER -e molecule_cmd=converge -e role_under_test=$ROLE_DIR


