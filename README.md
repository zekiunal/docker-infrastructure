# docker-infrastructure

## install

```bash
cd /

rm -fr /docker-infrastructure

git clone https://github.com/zekiunal/docker-infrastructure.git

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

