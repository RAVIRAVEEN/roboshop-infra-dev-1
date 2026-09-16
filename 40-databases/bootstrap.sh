#!/bin/bash

sudo dnf install ansible -y
 component=$1
#  environment=$2
# ansible-pull -U https://github.com/RAVIRAVEEN/roboshop-ansible-roles-tf-1.git -e component=$component main.yaml

REPO_URl=https://github.com/RAVIRAVEEN/roboshop-ansible-roles-tf-1.git
REPO_DIR="opt/roboshop/ansible"
ANSIBLE_DIR="roboshop-ansible-roles-tf-1"


mkdir -p $REPO_DIR
mkdir -p "/var/log/roboshop/"
touch ansible.log

cd $REPO_DIR

#check whether ansible repo cloned or not

if [-d $ANSIBLE_DIR]; then 
  
  cd $ANSIBLE_DIR
  git pull
 
 else 
    git clone $REPO_URL
    cd $ANSIBLE_DIR

fi

ansible-playbook -e component=$component main.yaml