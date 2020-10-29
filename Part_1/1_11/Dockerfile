FROM ubuntu:latest

RUN apt-get update -y && apt-get install git curl -y

# Installation instructions from https://github.com/docker-hy/backend-example-docker
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get update -y && apt install -y nodejs

# Check install
RUN node -v && npm -v

RUN git clone https://github.com/docker-hy/backend-example-docker
RUN mv backend-example-docker /usr/local/www

WORKDIR /usr/local/www

# For ex_1_12
ENV FRONT_URL=http://localhost:5000

RUN npm install

EXPOSE 8000

CMD npm start
