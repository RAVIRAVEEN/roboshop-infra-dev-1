#!/bin/bash

sudo dnf install ansible-core -y

 component=$1
ansible-pull -U https://github.com/RAVIRAVEEN/roboshop-ansible-roles-tf-1.git -e component=$component main.yaml