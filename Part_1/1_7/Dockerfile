FROM ubuntu:16.04

RUN apt-get update -y && apt-get install curl -y

COPY script.sh .

CMD ["/bin/bash", "script.sh"]