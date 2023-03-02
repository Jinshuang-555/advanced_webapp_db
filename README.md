# Database migrations for task management application

To run as init container for k8s cluster to conduct 0-down time databse migration on tables, views, and indexes


### build docker images

docker build -t init4 .

### conduct database migration using flyway

docker run init

### push docker image to docker hub

docker login
docker tag init4:latest jinshuangniu/advanced1cloud1computing:db.04
docker push jinshuangniu/advanced1cloud1computing:db.04
