#!/bin/bash
echo "Usage: sh configure_key_auth.sh <remote server name>"
public_key=~/.ssh/id_rsa.prod.pub
private_key=~/.ssh/id_rsa.prod
server=$1
user=`whoami`
profile_config=~/profile_config
echo attempting to login to $server

ssh -o ConnectTimeout=3 -o PasswordAuthentication=no -i $private_key $user@$server hostname
error_code=$?
echo $error_code
if [ $error_code -ne 0 ]; then
echo "Key based auth not configured.. configuring"
cat $public_key | ssh $user@$server "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
  if [ $? -ne 0 ]; then
    echo "Failed to update key authentication"
  else
    echo "Key authentication configured"
    scp -i $private_key $profile_config $user@$server:$profile_config
    ssh  -i $private_key $user@$server "echo "source $profile_config" >> ~/.bashrc"
  fi
fi
