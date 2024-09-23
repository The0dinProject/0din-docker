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
#      - ./0din/data:/app/0din
    environment:
      - NODE_ID=${NODE_ID} # public IP address or DNS
      - NODE_PORT=${NODE_PORT} # custom, default is 5000
      - KNOWN_NODES=${KNOWN_NODES} # "node1:port1,node2:port2"
      - DATABASE_URL=pgsql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}
    ports:
      - 5000:5000
    depends_on:
      - "0din-db"

  0din-db:
    container_name: 0din-db
    image: postgres
    environment:
      - POSTGRES_USER={DB_USER}
      - POSTGRES_PASSWORD={DB_PASSWORD}
      - POSTGRES_DB={DB_NAME}
    healthcheck:
      test: ["CMD-SHELL", "pg_isready", "-d", "{DB_NAME}"]
      interval: 30s
      timeout: 60s
      retries: 5
      start_period: 80s  
```
.env :

```
NODE_ID=
NODE_PORT=
KNOWN_NODES=
DB_HOST=
DB_USER=
DB_PORT=
DB_PASSWORD=
DB_NAME=
```
