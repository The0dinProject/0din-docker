
# 0din-docker

> [!WARNING]
> 0din is still in development 

## Installation
**1. Install docker :**
```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```
**2.  Clone 0din :**
```
git clone https://github.com/PastaGringo/0din-docker.git && cd 0din-docker
```
<details>
  <summary>docker-compose.yml</summary>
  
  ```bash
version: '3'

services:

  0din:
    container_name: 0din
    image: artemisarrow/0din-docker:latest
    volumes:
      - /share:/the/directory/to/be/shared
    environment:
      - NODE_ID=${NODE_ID} 
      - NODE_PORT=${NODE_PORT}
      - KNOWN_NODES=${KNOWN_NODES}
      - DB_PASSWORD=${DB_PASSWORD}
      - ENABLE_SSL=${ENABLE_SSL}
      - ENABLE_HTTPS_REDIRECT=${ENABLE_HTTPS_REDIRECT}
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
    ports:
      - 5432:5432
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
  
</details>

**3. Update .env vars with your settings :**
```
mv .env.example .env
nano .env
```
<details>
  <summary>.env</summary>
  
  ```bash
ADMIN_USER= # To be tested
ADMIN_PASSWORD= # To be tested
NODE_ID= # IP:PORT if no reverse proxy SSL ; FQDN if reverse proxy SSL : to be reached by other 0din nodes
NODE_PORT=5000 # Default 0din listening port
KNOWN_NODES= # IP:PORT if no reverse proxy SSL or FQDN if reverse proxy SSL : nodes to contact for first localsearch ;
ENABLE_SSL= # true/false(TO MODIFY) : enable 0din SSL support with auto-signed self-generated local certs
ENABLE_HTTPS_REDIRECT= # true/false : enable if using reverse proxy SSL to allow https download URL
DB_HOST=0din # default
DB_USER=0din # default
DB_PORT=5432 # default
DB_PASSWORD=0din # default
DB_NAME=0din # default
  ```
  
</details>

**4. Start 0din with docker compose :**
```
docker compose up -d && docker logs -f 0din
```

## Useful commands :

Run a manual file index :
```
docker exec -it 0din python -c "import indexer; indexer.indexer('/the/directory/to/be/shared')"
```

## To-Do :

- [x] First simple Docker how-to
- [ ] Make the container persistant
