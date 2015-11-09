# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Julian Labuschagne "julian@kuberfirma.com"

RUN apt-get update -yqq
RUN apt-get install -y byobu htop ruby-dev git 

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g bower grunt-cli
RUN useradd -ms /bin/bash frontend

USER frontend
WORKDIR /home/frontend
EXPOSE 9000
