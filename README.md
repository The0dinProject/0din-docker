# 0din-docker

docker-compose.yml :

```
version: '3'

services:

  0din:
    container_name: 0din
    image: pastagringo/0din-docker:latest
    volumes:
      - ./0din/share:/the/directory/to/be/shared
    environment:
      - NODE_ID=${NODE_ID} # public IP address or DNS
      - NODE_PORT=${NODE_PORT} # custom, default is 5000
      - KNOWN_NODES=${KNOWN_NODES} # "node1:port1,node2:port2"
    ports:
      - 5000:5000
```
.env :

```
NODE_ID=
NODE_PORT=
KNOWN_NODES=
```
