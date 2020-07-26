#!/bin/sh

# run the playbook to setup an EC2 instance to be 
# an automation CI server

HOST_IP=$RAMPUP_HOST
PLAYBOOK=amazon_os_playbook.yml

if [ -z $HOST_IP ]; then
    echo '\n\nmake sure env var is set: $ export RAMPUP_HOST=some.host.ip'
    echo "Usage: $ ./setip_ci_server.sh [optional]<tags>\n\n"
    exit 1
fi

if [ -z ${1+x} ]; then
    TAGS=""
else
    TAGS="--tags $1"
fi


echo "playbook: $PLAYBOOK"
echo "host: $HOST_IP"
echo "tags: $TAGS"
echo "cmd: ansible-playbook -i hosts $PLAYBOOK $TAGS -e ansible_host=$HOST_IP \n"

ansible-playbook -i hosts $PLAYBOOK $TAGS -e ansible_host=$HOST_IP 

