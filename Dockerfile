from ubuntu:latest

RUN apt-get update && apt-get install -y sudo curl git python3 python3-pip
# Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    && apt-get update && apt-get install -y nodejs && npm install -g serve
# MongoDB
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 \
    && echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    && sudo apt-get update && sudo apt-get install -y mongodb-org \
    && mkdir -p /data/db

# Install projects
RUN mkdir /entry /code
ADD entry /entry
RUN cd code && git clone --depth 1 https://github.com/GalMunGral/notube.git && cd notube && ./install.sh
RUN cd code && git clone --depth 1 https://github.com/GalMunGral/respotify.git && cd respotify && ./install.sh
RUN cd code && git clone --depth 1 https://github.com/GalMunGral/web-repl.git && cd web-repl && ./install.sh
RUN cd code && git clone --depth 1 https://github.com/GalMunGral/cs4400-marta-traffic.git marta && cd marta && ./install.sh

COPY start.sh /start.sh
CMD /start.sh