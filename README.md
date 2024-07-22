## This is docker environment for use Yandex Practicum with Python 3.8 on MacOS and Linux

## Point 1. At first time

Clone the repository

```bash
# GitHub CLI
gh repo clone Resmedia/python-yandex-practicum python
#or HTTPS
git clone https://github.com/Resmedia/python-yandex-practicum.git python
#P.S. "python" is the name of the folder where the repository will be cloned you can change it
```

### Create `.env` file in the root of the project with the following content. Replace `your_token` with your token
```bash
JUPYTER_TOKEN=your_token
```

### Attention!!! The current Dockerfile for INTEL Processor use only. For users who have `M` Silicon processor do next:
1. Delete `Dockerfile`
2. Rename `DockerfileSilicon` to `Dockerfile`

### Build the image
```bash
docker build -t practicum .
# or 
docker-compose up --build # to rebuild the image with logs
docker-compose up -d --build # to rebuild the image without logs
```

## Point 2. If point 1 done use this for starting project

### When you have already built the image and want to run the container
```bash
docker-compose up # with logs
docker-compose up -d # without logs
docker-compose down # to stop the container
```

### To see in the browser
```bash
http://localhost:8888
```

## Commands docker to help

### To see the logs
```bash
docker-compose logs
```
### To see the logs of a specific service
```bash
docker-compose logs <service>
```
### Create image using this directory's Dockerfile
```bash
docker build -t friendlyname . 
```
### Run "friendlyname" mapping port 4000 to 80
```bash
docker run -p 4000:80 friendlyname
```
### Same thing, but in detached mode
```bash
docker run -d -p 4000:80 friendlyname
```
### See a list of all running containers
```bash
docker ps
```
### Gracefully stop the specified container
```bash
docker stop <hash>
```
### See a list of all containers, even the ones not running
```bash
docker ps -a
```
### Force shutdown of the specified container
```bash
docker kill <hash>
```
### Remove the specified container from this machine
```bash
docker rm <hash>
```
### Remove all containers
```bash
docker rm $(docker ps -a -q)
```
### Show all images on this machine
```bash
docker images -a
```
### Remove the specified image from this machine
```bash
docker rmi <imagename>
```
### Remove all images from this machine
```bash
docker rmi $(docker images -q)
```
### Log in this CLI session using your Docker credentials
```bash
docker login
```
### Tag \<image> for upload to registry
```bash
docker tag <image> username/repository:tag
```
### Upload tagged image to registry
```bash
docker push username/repository:tag
```
### Run image from a registry
```bash
docker run username/repository:tag
```
