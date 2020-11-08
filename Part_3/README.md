# Exercises for [part 3](https://devopswithdocker.com/part3/)

## 3.1

Return back to our [frontend](https://github.com/docker-hy/frontend-example-docker) & [backend](https://github.com/docker-hy/backend-example-docker) Dockerfiles and you should see the some mistakes we now know to fix.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both programs, frontend and backend, by joining the `RUN` commands and removing useless parts.

After your improvements document the image sizes again. The size difference may not be very much yet. The frontend should be around 432MB when using FROM ubuntu:16.04. The backend should be around 351MB. The sizes may vary.

*Answer:*

*Contents of frontend Dockerfile (Actual Dockerfile in folder 3_1/frontend):*
```docker
FROM ubuntu:20.04

RUN apt-get update -y ; \
    apt-get install git curl -y ; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash ; \
    apt-get install nodejs -y ; \
    apt-get purge -y --auto-remove curl ; \
    rm -rf /var/lib/apt/lists/* ; \
    node -v && npm -v ;  

CMD git clone https://github.com/docker-hy/frontend-example-docker ; \
    mv frontend-example-docker /usr/local/www ;

WORKDIR /usr/local/www

CMD npm install ; \
    npm run build ;   \
    npm install -g serve ; \
    npm run build

EXPOSE 5000

ENV API_URL=http://localhost:8000

CMD serve -s -l 5000 dist
```

*Contents of backend Dockerfile (Actual Dockerfile in folder 3_1/backend):*
```docker
FROM ubuntu:20.04

RUN apt-get update -y && apt-get install git curl -y ; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash ; \
    apt install -y nodejs ; \
    node -v && npm -v ; 

CMD git clone https://github.com/docker-hy/backend-example-docker ; 

WORKDIR /usr/local/www

RUN mv backend-example-docker /usr/local/www ; \
    npm install ; \
    apt-get purge -y --auto-remove curl ; \
    rm -rf /var/lib/apt/lists/*

ENV FRONT_URL=http://localhost:5000

EXPOSE 8000

CMD npm start
```

## 3.2 A deployment pipeline to heroku

Let’s create our first deployment pipeline!

For this exercise you can select which ever web application you already have containerized.

If you don’t have any web applications available you can use any one from this course and modify it. (Such as the course material itself)

Let’s use GitHub, CircleCI, and Heroku to deploy to heroku. You can also use GitHub actions instead of CircleCI.

CircleCI offers orbs for Heroku deployment, but you can just use the instructions from Heroku (or exercise 1.16).

Submit a link to the repository with the config.


## 3.3 Building images inside of a container

Watchtower uses volume to docker.sock socket to access Docker daemon of the host from the container. By leveraging this ourselves we can create our own simple build service.

Create a project that downloads a repository from github, builds a Dockerfile located in the root and then publishes it into Docker Hub.

You can use any programming language / technology for the project implementation. A simple bash script is viable

Then create a Dockerfile for it so that it can be run inside a container.

Make sure that it can build at least some of the example projects.

## 3.4

**This exercise is mandatory**

Security issues with the user being a root are serious for the example frontend and backend as the containers for web services are supposed to be accessible through the internet.

Make sure the containers start their processes as a non-root user.

  > TIP `man chown` may help you if you have access errors

