FROM ubuntu:latest

RUN apt-get update -y && apt-get install git curl -y

# Installation instructions from https://github.com/docker-hy/frontend-example-docker
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get update -y && apt install -y nodejs

# Check install
RUN node -v && npm -v

RUN git clone https://github.com/docker-hy/frontend-example-docker
RUN mv frontend-example-docker /usr/local/www

WORKDIR /usr/local/www

RUN npm install
RUN npm run build
RUN npm install -g serve

EXPOSE 5000

# For ex_1_12
# ENV API_URL=http://localhost:8000
RUN npm run build

CMD serve -s -l 5000 dist