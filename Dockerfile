#sudo docker build -t nvim_in_ubuntu_22.04 .
#sudo docker run --name nvim  -v $HOME:$HOME  -dit nvim_in_ubuntu_22.04
#sudo docker exec -it nvim /bin/bash

# base image
FROM ubuntu:22.04

WORKDIR /app
COPY ./nvim/  /tmp/nvim
RUN apt update
RUN apt install software-properties-common -y

RUN /bin/bash /tmp/nvim/docker_setup.sh
