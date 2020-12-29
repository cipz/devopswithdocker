#!/bin/bash

git clone https://github.com/cipz/CoronaZ/

docker build -t cipz/devopswithdocker_ex_1_15:latest CoronaZ/coronaz-zombie/.

docker login

docker push cipz/devopswithdocker_ex_1_15:latest