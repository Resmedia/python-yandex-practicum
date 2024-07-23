# This is docker environment for use Yandex Practicum with Python 3.11 on MacOS and Linux

![Image](https://snipboard.io/Ua4z6h.jpg)

## Requirements
- Docker
- Docker Compose
- GitHub CLI (optional)
- Internet connection

## Container Configuration
<details>
  <summary>Open under the hood configuration</summary>

The container is built using the `continuumio/miniconda3` image as a base, providing support for Conda. Here's a detailed list of what's inside the container:

### Conda Packages
- Python 3.11
- pip
- wheel
- ipykernel
- ipython
- ipython_genutils
- jupyter
- jupyter_client
- jupyter_console
- jupyter_core
- jupyterlab
- jupyterlab_server
- requests
- nest-asyncio

### Pip Packages
- beautifulsoup4
- matplotlib
- nltk
- numpy
- pandas
- plotly
- psycopg2-binary
- regex
- scikit-learn
- scipy
- seaborn
- sqlalchemy
- statsmodels
- catboost
- pyspark
- torch
- transformers
- pillow
- keras
- tensorflow
- traitlets (version 5.9.0)
- notebook (version 6.4.0)
- jupyter_contrib_nbextensions
- jupyter_nbextensions_configurator

### Jupyter Notebook Extensions
- toc2/main

### Additional Configuration
- A dedicated directory `/opt/conda` is created for the Conda environment.
- The working directory is set to `/workspace`.
- Port 8888 is exposed for Jupyter Notebook.
- Jupyter Notebook is configured to start with the command to run on IP `0.0.0.0`, without opening a browser, and allowing root access.

## PostgreSQL Database Configuration

The project includes a PostgreSQL database container configured as follows:

- **Image**: `postgres:latest` - This uses the latest version of the official PostgreSQL image.
- **Container Name**: `practicum_postgres` - The name of the container running PostgreSQL.
- **Environment Variables**:
    - `POSTGRES_USER=practicum` - The default user for PostgreSQL.
    - `POSTGRES_PASSWORD=toor` - The password for the `practicum` user.
    - `POSTGRES_DB=practicum` - The default database created when the container starts.
- **Ports**:
    - `5432:5432` - The PostgreSQL default port `5432` is exposed and mapped to the host.
- **Volumes**:
    - `postgres-data:/var/lib/postgresql/data` - This volume is used to persist the database data even after the container is stopped or deleted.

This configuration ensures that the PostgreSQL database is ready to be used by the application with the specified settings.
</details>

## Point 1. If it is at first time install

### 1.1 Clone the repository

```bash
# GitHub CLI
gh repo clone Resmedia/python-yandex-practicum python
#or HTTPS
git clone https://github.com/Resmedia/python-yandex-practicum.git python
#P.S. "python" is the name of the folder where the repository will be cloned you can change it
```

### 1.2 In docker settings add folder `python` to the shared folders settings->resources->file sharing

## !!!Attention. The current Dockerfile for INTEL Processor use only. For users who have `M` Silicon processor do next:
1. Delete `Dockerfile`
2. Rename `DockerfileSilicon` to `Dockerfile`

## !!! Before building the project connect to good internet connection, because the image is about `4.5 GB`

### 1.3 Build the image
```bash
docker build -t practicum .
# or 
docker-compose up --build # to rebuild the image with logs
docker-compose up -d --build # to rebuild the image without logs
```

## Point 2. If `Point 1` done use this for starting project

### 2.1 When you have already built the image and want to run the container
```bash
docker-compose up # with logs
docker-compose up -d # without logs
docker-compose down # to stop the container
```

### 2.2 To see in the browser
```bash
http://localhost:8888
```

## Commands to help you work with Docker

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
