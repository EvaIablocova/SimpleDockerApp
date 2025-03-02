#1
maven install

#2
docker-compose up --build

# Instructions

#### Precondition

Shows all containers (only the active ones if the **-a** option is used):
```
docker ps -a
```
Shows all images from the environment where it is called:
```
docker images
```


Creates and starts all containers based on the **docker-compose.yml** file. The **--force-recreate** command can be used to force recreate the containers.
```
docker-compose up -d
```

Stops all containers based on the **docker-compose.yml** file:
```
docker-compose stop
```
Пересобрать образ с очисткой кэша:

 docker-compose down
 docker-compose build --no-cache
 docker-compose up -d

```
Starts all containers based on the **docker-compose.yml** file:
```
docker-compose start
```

Forcibly deletes all containers based on the **docker-compose.yml** file:
```
docker-compose rm -f
```

Stops and deletes all containers based on the **docker-compose.yml** file:
```
docker-compose down
```

Executes a command inside the container:
```
docker exec –it <container_name> <command>
```

Displays all the logs of the services started based on the **docker-compose.yml** file:
```
docker-compose logs
```

Displays the data volumes from the environment where it is called:
```
docker volume ls
```

**Warning**! Forcibly deletes the container with ID **<container_id>**:
```
docker rm <container_id> -f
```

**Warning**! Forcibly deletes the image with ID **<image_id>**:
```
docker rmi <image_id> -f
```

**Warning**! Forcibly deletes all containers from the environment where it is called:
```
docker rm $(docker ps -aq) -f
```

**Warning**! Forcibly deletes all images from the environment where it is called:
```
docker rmi $(docker images -q) -f
```

**Warning**! Deletes all containers, images, and networks that are unused from the environment where it is called (we can use **--volumes** to also delete the associated data volumes):
```
docker system prune
```

Displays the processes running the started containers:
```
docker-compose top
```

Displays data about RAM and CPU used by the container:
```
docker stats
```

#### Specific Commands
Loads the database **<db_name>** from the dump **<dump_name>.sql** into the container **<container_name>**:
```
docker exec –i <container_name> psql –U postgres –d <db_name> < <dump_name>.sql

docker exec -i cariere_db mysql -udefault -p5K1zOzvsz9 cariere<dump_2020_12_10

```

#Deploy to staging (steps):
```
1. Commit and push to the dev branch
2. Switch to the staging branch "git checkout staging"
3. Merge dev into staging "git merge dev"
4. Commit and push to the staging branch (after this, GitLab automatically initiates the deployment to staging)
5. Switch back to the dev branch "git checkout dev"
In one command:
git checkout staging && git merge dev && git push origin staging && git checkout dev
!!git checkout production && git merge dev && git push origin production && git checkout dev
```

#Import DB from dump:
```
docker exec -i cariere_db mysql -u[root] -p[password] [database] < [file]
docker exec -i cariere_db mysql -udefault -p5K1zOzvsz9 cariere < xxxx
tar -czvf /tmp/cariere_production_2023_03_10.tar.gz /srv/www/cariere/production
```
