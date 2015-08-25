# docker-infrastructure

cd /
rm -fr /docker-infrastructure
git clone https://github.com/zekiunal/docker-infrastructure.git
chmod -R +xr /docker-infrastructure/
cd /docker-infrastructure/

kill by name
docker rm -f  $(docker ps -a | awk '/application/{print $1}')

./install.sh




haproxy döngü içinde şişyor.
