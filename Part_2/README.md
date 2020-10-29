# Exercises for [part 2](https://devopswithdocker.com/part2/)

## 2.1

Exercises in part 2 should be done using `docker-compose`.

Container of `devopsdockeruh/first_volume_exercise` will create logs into its `/usr/app/logs.txt`.

Create a `docker-compose.yml` file that starts `devopsdockeruh/first_volume_exercise` and saves the logs into your filesystem.

Submit the `docker-compose.yml`, make sure that it works simply by running `docker-compose up` if the log file exists.

*Answer:*
```
 ✘ cip  ~/Desktop/UNI/devopswithdocker/Part_2/2_1   master ±  docker-compose up   
Creating network "2_1_default" with the default driver
Creating ex_2_1 ... done
Attaching to ex_2_1
ex_2_1    | Wrote to file /usr/app/logs.txt
ex_2_1    | Wrote to file /usr/app/logs.txt
ex_2_1    | Wrote to file /usr/app/logs.txt
ex_2_1    | Wrote to file /usr/app/logs.txt
ex_2_1    | Wrote to file /usr/app/logs.txt
ex_2_1    | Wrote to file /usr/app/logs.txt
^CGracefully stopping... (press Ctrl+C again to force)
Stopping ex_2_1 ... done
```
The `logs.txt` file is being edited by the processes in the container.
```
 cip  ~/Desktop/UNI/devopswithdocker/Part_2/2_1   master ±  tail -f logs.txt
Thu, 29 Oct 2020 19:20:41 GMT
Thu, 29 Oct 2020 19:20:44 GMT
Secret message is:
"Volume bind mount is easy"
Thu, 29 Oct 2020 19:20:50 GMT
Thu, 29 Oct 2020 19:20:53 GMT
Thu, 29 Oct 2020 19:20:56 GMT
Thu, 29 Oct 2020 19:20:59 GMT
Secret message is:
"Volume bind mount is easy"
Thu, 29 Oct 2020 19:21:05 GMT
Thu, 29 Oct 2020 19:21:08 GMT
```

Contents of `docker-compose.yml` (Actual `docker-compose.yml` in folder 2_1):
```docker compose
version: '3' 

services: 
    ex_2_1:  
      image: devopsdockeruh/first_volume_exercise
      build: . 
      volumes: 
        - ./logs.txt:/usr/app/logs.txt
      container_name: ex_2_1
```

## 2.2

`devopsdockeruh/ports_exercise` starts a web service that will answer in port `80`.

Create a `docker-compose.yml` and use it to start the service so that you can use it with your browser.

Submit the `docker-compose.yml`, make sure that it works simply by running `docker-compose up`.

*Answer:*
```
 cip  ~/Desktop/UNI/devopswithdocker/Part_2/2_2   master ±  docker-compose up
Creating network "2_2_default" with the default driver
Creating ex_2_2 ... done
Attaching to ex_2_2
ex_2_2    | 
ex_2_2    | > ports_exercise@1.0.0 start /usr/app
ex_2_2    | > node index.js
ex_2_2    | 
ex_2_2    | Listening on port 80, this means inside of the container. Use -p to map the port to a port of your local machine.
```

Contents of `docker-compose.yml` (Actual `docker-compose.yml` in folder 2_2):
```docker compose
version: '3' 

services: 
    ex_2_2:  
      image: devopsdockeruh/ports_exercise
      build: . 
      ports: 
        - 80:80
      container_name: ex_2_2
```

The answer from the browser went calling `http://localhost:80/` : `Ports configured correctly!!`.