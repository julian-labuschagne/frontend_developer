# Version: 0.0.1
FROM ruby:latest
MAINTAINER Julian Labuschagne "personxx@gmail.com"

RUN apt-get update -yqq && \
  apt-get upgrade -yqq && \
  apt-get install -y curl git

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
  apt-get install -y nodejs

# Install bower and grunt-cli
RUN npm install -g bower grunt-cli gulp-cli

# Install Hugo
RUN curl -o /opt/hugo.tar.gz -SL "https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_linux_$(dpkg --print-architecture).tar.gz"
RUN cd /opt/ && tar -zxvf hugo.tar.gz
RUN cp /opt/hugo_0.15_linux_amd64/hugo_0.15_linux_amd64 /usr/local/bin/hugo

# Install Jekyll
RUN gem install jekyll

# Create a non privileged user
RUN useradd -ms /bin/bash frontend

USER frontend
VOLUME /home/frontend
WORKDIR /home/frontend
ENV TERM=linux

EXPOSE 4000
EXPOSE 9000
EXPOSE 35729

CMD ["/bin/bash"]
