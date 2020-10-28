# Exercises for [part 1](https://devopswithdocker.com/part1/)

## 1.1 Getting started

Since we already did “Hello, World!” in the material let’s do something else.

Start 3 containers from image that does not automatically exit, such as nginx, detached.

Stop 2 of the containers leaving 1 up.

Submitting the output for docker ps -a is enough to prove this exercise has been done.

*Answer:*
```
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker run -d nginx   
28cdbffadabbc166abfd80fb46d5b75c24bbf4eba78a2e13ba0af5c047ee1cd7
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker run -d gitlab/gitlab-ce
292bbc155a069b061bb2ae5428639bbc5bf086d5852646e0c1c4e514269009c3
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker run -d wurstmeister/kafka
2f6147080d353f9268d2c00ddfc89e7212800e3f4f3f9b1a3264e35f026c9b47
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker ps -a                    
CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS                             PORTS                     NAMES
2f6147080d35        wurstmeister/kafka   "start-kafka.sh"         10 seconds ago      Exited (1) 9 seconds ago                                     happy_borg
292bbc155a06        gitlab/gitlab-ce     "/assets/wrapper"        22 seconds ago      Up 21 seconds (health: starting)   22/tcp, 80/tcp, 443/tcp   blissful_hofstadter
28cdbffadabb        nginx                "/docker-entrypoint.…"   27 seconds ago      Up 26 seconds                      80/tcp                    zen_hellman
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker stop 2f6147080d35            
2f6147080d35
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker stop 292bbc155a06
292bbc155a06
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker ps -a            
CONTAINER ID        IMAGE                COMMAND                  CREATED              STATUS                       PORTS               NAMES
2f6147080d35        wurstmeister/kafka   "start-kafka.sh"         49 seconds ago       Exited (1) 48 seconds ago                        happy_borg
292bbc155a06        gitlab/gitlab-ce     "/assets/wrapper"        About a minute ago   Exited (137) 4 seconds ago                       blissful_hofstadter
28cdbffadabb        nginx                "/docker-entrypoint.…"   About a minute ago   Up About a minute            80/tcp              zen_hellman
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  
```

## 1.2 Cleanup

We’ve left containers and a image that won’t be used anymore and are taking space, as docker ps -as and docker images will reveal.

Clean the docker daemon from all images and containers.

Submit the output for docker ps -a and docker images

*Answer:*
```
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker images
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
gitlab/gitlab-ce     latest              8ab13771717b        6 days ago          2.04GB
nginx                latest              f35646e83998        2 weeks ago         133MB
wurstmeister/kafka   latest              40094a582680        2 months ago        435MB
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker ps -a 
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker rmi 8ab13771717b
Untagged: gitlab/gitlab-ce:latest
Untagged: gitlab/gitlab-ce@sha256:2c329e4b32adb1f5a396401b34ab1ee7197eb30bb4c63ff20fe53381fd70ac07
Deleted: sha256:8ab13771717ba0518096a76b36d8643a9b30562ed6a8e344c9d7ff8f0f1ab964
Deleted: sha256:927a6e983863c7989f3856382a111235722a70619e4e2378eb1d1cbd5f4b59c8
Deleted: sha256:88afe332290d1fa85ad10eb25a6c48fb92bd6925170756c219f8e9eb5e9afdfc
Deleted: sha256:11aeb63b9c8f948fdf73e7a0924840bfba7f4a6009053608d1b0497c46c8d266
Deleted: sha256:770796052fd1f00264888b9de9a78ca26576e0aa80cb0180279ab758080b1572
Deleted: sha256:0e53fc3d2d34807fc3d185555f20faf43a9e54e6e36a831ce5945d9a984bca76
Deleted: sha256:2f5f585327bbdbae9a93bfe28dca994248d5e6c5b72e2b8d3d3a9202ef4db8fa
Deleted: sha256:b8d6781b2914e44c86b1f158105f220044db7a1e9daf4f55f366dcd888003513
Deleted: sha256:b317b787bb952652819917ee6a67b6c3ce01487798e8f0523608a5903a1420ff
Deleted: sha256:e7623e01200a173d013d81f141cf2210c13657cecb61bf0718409174da3d483c
Deleted: sha256:f577d0e0bf7011714547f1ea1e3536cad7d8575a4a6357fae65b7e8a42914889
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker rmi f35646e83998            
Untagged: nginx:latest
Untagged: nginx@sha256:ed7f815851b5299f616220a63edac69a4cc200e7f536a56e421988da82e44ed8
Deleted: sha256:f35646e83998b844c3f067e5a2cff84cdf0967627031aeda3042d78996b68d35
Deleted: sha256:9ae13393c37dce86ebd3ea923033503f2cb8f4d6b28fb554827c518a2d171535
Deleted: sha256:423bc419c558f70051d849a661a7a287b61af2037c4ce24f7bbe433e9fb63f39
Deleted: sha256:4cd04e685e3a8e5697bb91e2e6c6b477bc8c4f9a43f05578af3c0a788f011756
Deleted: sha256:611e1562bc2f489d72961d8e2e37f3097d64d9c5212a68c26aab2ad971c98f6d
Deleted: sha256:d0fe97fa8b8cefdffcef1d62b65aba51a6c87b6679628a2b50fc6a7a579f764c
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker rmi 40094a582680            
Untagged: wurstmeister/kafka:latest
Untagged: wurstmeister/kafka@sha256:9be6d5ae19a6455998883fffe0e46ac9dcbee4d09861c791df97ed1883f03c49
Deleted: sha256:40094a5826806d0db6b56bd9f5191649df4290af91ba042545fb5a164574e766
Deleted: sha256:db53492743beed716166777e0e7d4790d39171015f06b107a6411f8e2e8da476
Deleted: sha256:5ab36a1a5e768a1a492113bd7a4a09c99499351501e2dd72d6f6035f73880d13
Deleted: sha256:fd448a40e7c41ba1d53ac6a873223b93d8b72b67ffcd1cb7c8b8556356a8461a
Deleted: sha256:aba8cd4318a8a15f59f305368e49cc3bbd0d6d72171a0b24d08cc00513b14ef4
Deleted: sha256:c318fbba92645a83843c387bd78497e7b143ecc7f5ed99dcb7d38fc62442c02a
Deleted: sha256:f1b5933fe4b5f49bbe8258745cf396afe07e625bdab3168e364daf7c956b6b81
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker images          
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  docker ps -a  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
 ⚙ cip  ~/Desktop/UNI/devopswithdocker  

```


