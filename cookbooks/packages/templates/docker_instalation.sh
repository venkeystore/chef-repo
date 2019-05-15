
#! /bin/bash

# you can be got docker instalation commands from this page ---->>  https://docs.docker.com/install/linux/docker-ee/rhel/

echo
echo
echo "Removing  previous package"
echo
echo
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
				  

sudo rm /etc/yum.repos.d/docker*.repo


export DOCKERURL="<DOCKER-EE-URL>"


sudo -E sh -c 'echo "$DOCKERURL/rhel" > /etc/yum/vars/dockerurl'


sudo sh -c 'echo "7" > /etc/yum/vars/dockerosversion'

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager --enable rhel-7-server-extras-rpms
sudo yum-config-manager --enable extras
sudo subscription-manager repos --enable=rhel-7-for-power-le-extras-rpms
sudo yum makecache fast
sudo yum -y install container-selinux  


sudo yum-config-manager --enable rhui-REGION-rhel-server-extras

sudo yum-config-manager --enable rhui-rhel-7-server-rhui-extras-rpms

sudo -E yum-config-manager \
    --add-repo \
    "$DOCKERURL/rhel/docker.repo"
sudo yum -y install docker
echo
echo
echo "Installing Docker"
echo "=====ooo====="	
sudo yum -y install docker

sudo yum list docker --showduplicates | sort -r
echo
echo "Select_above_package-which you want use"
echo -e "Enter fully qualified package name in the above lines  :\c"
read $1

sudo yum -y install $1


echo
echo
echo
echo

echo "Docker_status"
echo "=====ooo====="

sudo systemctl status docker
echo
echo
sudo systemctl start docker
echo
echo
sudo systemctl status docker
echo
echo
sudo systemctl enable docker
echo
echo
sudo systemctl status docker
echo
echo
echo
echo
echo "                                  Instalation_compleated and you can be utilized docker services                                 "
echo "___________________________________________________________________________________________"
echo
echo
echo "==============>>>>>>>>>>THANK YOU<<<<<<<<<<<<<<<==========================="
echo "                                                                              "
echo "_______________________________________________________________________________________________"


