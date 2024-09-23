# 0din-docker

docker-compose.yml :

```
version: '3'

services:

  0din:
    container_name: 0din
    image: pastagringo/0din-docker:latest
    volumes:
      - ./SOURCES:/the/directory/to/be/shared
      # - ./0din:/app/0din
    environment:
      - NODE_ID=${NODE_ID} # public IP address or DNS
      - NODE_PORT=${NODE_PORT} # custom, default is 5000
      - KNOWN_NODES=${KNOWN_NODES} # "node1:port1,node2:port2"
      - DB_PASSWORD=${DB_PASSWORD}
      - DB_USER=${DB_USER}
      - DB_NAME=${DB_NAME}
      - DB_HOST=${DB_HOST}
      - DB_PORT=${DB_PORT}
    ports:
      - 5000:5000
    depends_on:
      - "0din-postgres"

  0din-postgres:
    container_name: 0din-postgres
    image: postgres:14-alpine
    restart: always
    environment:
      - POSTGRES_PASSWORD=${DB_PASSWORD}
      - POSTGRES_USER=${DB_USER}
      - POSTGRES_DB=${DB_NAME}
    # ports:
    #   - 5432:5432
    volumes:
      - 0din-postgres-db:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${DB_USER}"]
      interval: 30s
      timeout: 30s
      retries: 3

volumes:
  0din-postgres-db:
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
