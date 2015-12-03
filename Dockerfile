# Version: 0.0.1
FROM debian:latest
MAINTAINER Julian Labuschagne "julian@kuberfirma.com"

RUN apt-get update -yqq && apt-get upgrade -yqq
RUN apt-get install -y curl git vim byobu

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g bower grunt-cli

RUN curl -o /opt/hugo.tar.gz -SL "https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_linux_$(dpkg --print-architecture).tar.gz"
RUN cd /opt/ && tar -zxvf hugo.tar.gz 
RUN cp /opt/hugo_0.15_linux_amd64/hugo_0.15_linux_amd64 /usr/local/bin/hugo


RUN useradd -ms /bin/bash frontend

USER frontend
WORKDIR /home/frontend
ENV TERM=linux

EXPOSE 80
EXPOSE 9000
EXPOSE 35729

CMD ["/usr/bin/byobu"]
