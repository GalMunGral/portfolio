from ubuntu:latest

RUN apt-get update
RUN apt-get install -y sudo curl git
# Python
RUN apt-get install -y  python3 python3-pip python3-venv
# Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g serve nodemon
# MySQL
RUN apt-get install -y mysql-server
RUN usermod -d /var/lib/mysql mysql
RUN chown -R mysql:mysql /var/lib/mysql
# MongoDB
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN sudo apt-get update && sudo apt-get install -y mongodb-org
RUN mkdir -p /data/db

# Install projects
RUN mkdir /entry /code
ADD entry /entry
RUN cd code && git clone https://github.com/GalMunGral/notube.git
RUN cd code/notube && ./install.sh
RUN cd code && git clone https://github.com/GalMunGral/respotify.git
RUN cd code/respotify && ./install.sh
RUN cd code && git clone https://github.com/GalMunGral/web-repl.git
RUN cd code/web-repl && ./install.sh
# RUN git clone https://github.com/GalMunGral/cs4400-marta-traffic.git

COPY start.sh /start.sh
CMD ./start.sh