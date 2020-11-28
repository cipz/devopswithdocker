FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y install gcc

WORKDIR /app

COPY ./hello_world.c /app
