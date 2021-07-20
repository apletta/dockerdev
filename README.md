# dockerdev

First, make sure [Docker](https://docs.docker.com/desktop/) is installed.

Thye, commands to create/activate the environment (after Docker is installed):
1. Move to the dockerdev_home directory
```
$ cd dockerdev_home
```
2. Build the image
```
$ docker-compose build dockerdev
```
3. Bring the image up in the background
```
$ docker-compose up -d dockerdev
```
4. Attach to a shell
```
$ docker-compose exec dockerdev bash
```
- To exit the shell when you're done doing things in the container, just type exit. The docker image will stay active in the background until you do step 5 (so you recan re-attach when you want, by running step 4 again)
5. To close/remove the docker image (run from in the dockerdev_home directory, but outside of the docker environment)
```
$ docker-compose down
```

Other notes
- The `.yml` file defines how the dockerfiles get called. You shouldn't have to edit this I don't think.
- You should be able to add new packages to the `.dockerfile`
- Note that this image uses volumes so the changes you make while in the container will persist outside the container and after you close the docker image. Changes made outside the container also appear in the container. 
