#!/bin/sh

# set env var with host.
# ie: $ export RAMPUP_HOST=3.80.86.160

SERVER=$RAMPUP_HOST
ROLE_DIR=files/es_zip_role

echo ''
echo 'submitting changes to ' $SERVER

rsync -avz $ROLE_DIR ec2-user@$SERVER:~/

echo 'changes successfully sync'd to server 
echo ''


