# # advanced_webapp_db

docker build -t init .

# -t to psecify docker image name
# . look for Dockerfile under current directory 

docker run init

# -d run docker container in detach mode (background)

# push docker image to docker hub

docker login
docker tag init:latest jinshuangniu/advanced1cloud1computing:db.01
docker push jinshuangniu/advanced1cloud1computing:db.01

