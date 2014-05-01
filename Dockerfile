# DOCKER-VERSION 0.10.0

# Pull base image.
FROM ubuntu:14.04

# Install Node.js
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y phantomjs

# Append to $PATH variable.
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

ADD . /src

RUN cd /src; npm install

EXPOSE 8080

ENV NODE_CONFIG_DIR /src/config/

CMD ["node", "/src/app.js"]