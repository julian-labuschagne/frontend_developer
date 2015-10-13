# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Julian Labuschagne "julian@kuberfirma.com"

RUN apt-get update
RUN apt-get install -y byobu htop nodejs npm ruby-dev git 
RUN npm install -g bower grunt-cli
RUN gem install jekyll
RUN useradd -ms /bin/bash frontend
RUN ln -s /usr/bin/nodejs /usr/bin/node

USER frontend
WORKDIR /home/frontend
EXPOSE 4000
