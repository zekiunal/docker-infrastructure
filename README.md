# docker-infrastructure - Centos 7

## stacks

* consul
* haproxy
* webserver

## pre-install

```bash
####################################################################################
# Update CentOS 7
####################################################################################
yum update -y
yum install -y epel-release
yum update -y

####################################################################################
# Install Docker
####################################################################################
yum install -y docker

####################################################################################
# Docker to start at boot
####################################################################################
systemctl enable docker

####################################################################################
# start docker
####################################################################################
systemctl start docker


####################################################################################
# Install Git
####################################################################################
if ! rpm -qa | grep -qw git-core; then
    yum install -y git-core
    echo "git installed."
fi

```

## install

```bash
cd /

rm -fr /docker-infrastructure

git clone --depth=1 git://github.com/zekiunal/docker-infrastructure.git

chmod -R +xr /docker-infrastructure/

cd /docker-infrastructure/

./install.sh
```

## kill all container by name
```bash
docker rm -f  $(docker ps -a | awk '/application/{print $1}')
```

## Get Consul Server IP
```bash
echo $(docker inspect -f '{{ .NetworkSettings.IPAddress }}' consul_server)
```

## Thanks

* Huseyin Babal
* Selim Ekizoglu

