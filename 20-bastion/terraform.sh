#!/bin/bash 
  
growpart /dev/nvme0n1 4
sudo lvextend -r -L +10G /dev/RootVG/homeVol

xfs_growfs /home

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


