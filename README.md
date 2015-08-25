# docker-infrastructure

```bash
cd /

rm -fr /docker-infrastructure

git clone https://github.com/zekiunal/docker-infrastructure.git

chmod -R +xr /docker-infrastructure/

cd /docker-infrastructure/

./install.sh
```

kill by name
docker rm -f  $(docker ps -a | awk '/application/{print $1}')


$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' consul_server)


"


