#!/bin/bash 

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


# REPO_URl=https://github.com/RAVIRAVEEN/roboshop-infra-dev-1.git
# # REPO_DIR="opt/roboshop/ansible"
# INFRA_DEV_DIR="roboshop-infra-dev-1"




# cd $INFRA_DEV_DIR

# #check whether ansible repo cloned or not

# if [-d $INFRA_DEV_DIR]; then 
  
#   cd $INFRA_DEV_DIR,
#    git pull
 
#  else 
#     git clone $REPO_URL
#       cd $INFRA_DEV_DIR,


# fi