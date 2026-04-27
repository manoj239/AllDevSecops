docker volume ls
ll /var/lib/docker/volumes/
docker volume create mongodb
docker volume ls
ll /var/lib/docker/volumes/mongodb/_data/
docker network create mongodbnw 
docker run --rm -d --name mongo -v mongodb:/data/db \
  --network mongodbnw \
  -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  -p 27017:27017 mongo:latest
docker exec -it mongo bash
mongosh -u mongoadmin -p
secret
show dbs;
use alpha;
show collections;
db.custdata.countDocuments({sex: 'M'})
db.custdata.find({"name": "Jessica Shaw"})
db.custdata.countDocuments()
exit
ll /var/lib/docker/volumes/mongodb/_data/
docker stop mongo
docker ps
docker volume ls
docker run --rm -d --name mongo -v mongovol:/data/db \
--network mongodbnw \
-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
-e MONGO_INITDB_ROOT_PASSWORD=secret \
-p 27017:27017 mongo:latest
docker volume ls 
docker ps 
docker volume ls 
ll /var/lib/docker/volumes/mongovol/_data/
docker volume rm mongovol
cd /var/lib/docker/volumes/
ls
cp -rf mongodb/ mongodata/ 
ll mongodata/
docker run -v /etc:/etc-container ubuntu
docker run -v /etc:/etc-container:ro ubuntu
Here:
•	/etc → directory on the Docker host
•	/etc-container → directory inside the container
docker run -v /etc:/etc-container:ro ubuntu
https://github.com/google/cadvisor
VERSION=v0.49.1
sudo docker run --rm \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:$VERSION
docker ps
docker run -d \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  -p 9100:9100 \
  quay.io/prometheus/node-exporter:latest \
  --path.rootfs=/host
docker network ls
apt install net-tools -y
ifconfig
docker run --rm -d --name alpha -p 8000:8888 sreeharshav/utils:latest
docker run --rm -d --name bravo -p 9000:8888 sreeharshav/utils:latest
docker ps
docker inspect alpha
docker inspect bravo
docker exec -it alpha bash
ping to 172.17.0.3 #(bravo ip)
ping bravo
exit
docker network ls
docker network create myapp --driver bridge
docker network connect myapp alpha
docker network connect myapp bravo
docker exec -it alpha bash
ifconfig #new ip and eth1 will be there
docker exec -it bravo bash
ping alpha
docker stop $(docker ps -aq)
docker run --rm -d --name bravo -p 9000:8888 --network myapp sreeharshav/utils:latest
docker run --rm -d --name alpha -p 8000:8888 --network myapp sreeharshav/utils:latest
docker ps 
docker exec -it alpha bash
ifconfig
ping bravo

docker inspect  alpha #(In networks we can see as myapp) 
VERSION=v0.49.1
sudo docker run \
--volume=/:/rootfs:ro \
--volume=/var/run:/var/run:ro \
--volume=/sys:/sys:ro \
--volume=/var/lib/docker/:/var/lib/docker:ro \
--volume=/dev/disk/:/dev/disk:ro \
--network=host \
--detach=true \
--name=cadvisor \
--privileged \
--device=/dev/kmsg \
gcr.io/cadvisor/cadvisor:$VERSION
docker ps 
docker inspect cadvisor #(In networks we can see as host)
docker images
docker image  inspect c02cf39d3dba #In exposed ports if we see it is 8080
ec2-44-223-101-229.compute-1.amazonaws.com:8080

docker network ls
docker run --rm -d --name demo -v /var/run/docker.sock:/var/run/docker.sock --network none sreeharshav/utils:latest  #No network interface is assigned.
In above command, We mounted Docker socket (/var/run/docker.sock), so commands like docker ps, docker images, etc., work inside the container.
docker ps
docker inspect demo #(In networks we can see as none)
docker exec -it demo bash 
docker images
docker ps
docker stop alpha bravo
docker ps -a
docker rm cadvisor