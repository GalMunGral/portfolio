from ubuntu:latest
RUN apt-get update
RUN apt-get install -y sudo curl git
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y mysql-server
RUN apt-get install -y  python3 python3-pip python3-venv
RUN npm install -g serve nodemon
RUN mkdir /entry /code
ADD entry /entry
RUN cd code && git clone https://github.com/GalMunGral/respotify.git && cd respotify && ./install.sh
# RUN cd code && git clone https://github.com/GalMunGral/notube.git
# RUN git clone https://github.com/GalMunGral/web-repl.git
# RUN git clone https://github.com/GalMunGral/cs4400-marta-traffic.git
# RUN (cd cs4400-marta-traffic/backend && npm install); (cd cs4400-marta-traffic/frontend && npm install)
COPY start.sh /start.sh
CMD ./start.sh