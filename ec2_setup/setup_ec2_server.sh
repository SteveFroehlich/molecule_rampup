#!/bin/sh

# run the playbook to setup an EC2 instance to be 
# an automation CI server

HOST_IP=$1
if [ -z ${1+x} ]; then
    echo "\n\nUsage: $ ./setip_ci_server.sh <playbook> <host-ip> [optional]<tags>\n\n"
    exit 1
fi


if [ -z ${2+x} ]; then
    PLAYBOOK=amazon_os_playbook.yml
else
    PLAYBOOK=$2
fi

if [ -z ${3+x} ]; then
    TAGS=""
else
    TAGS="--tags $3"
fi


echo "playbook: $PLAYBOOK"
echo "host: $HOST_IP"
echo "tags: $TAGS"
echo "cmd: ansible-playbook -i hosts $PLAYBOOK $TAGS -e ansible_host=$HOST_IP \n"

ansible-playbook -i hosts $PLAYBOOK $TAGS -e ansible_host=$HOST_IP 
