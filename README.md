# URL Detection Deployment
> This is a guide for deploying URL detection serice on a Linux VM.
## Table of contents
***
* [Project Structure](#project-structure)
* [Usage](#usage)

## Project Structure
***
### docker-compose.yml
Currently contains three services:
* url-crawler
* url-detection
* postgresSQL

### /sql
*.sql scripts that are executed when the db container is created

### /env
some environment variables that will be passed into containers

### /log
several .log file
***
## Usage
Create and run docker containers.
The server will be running on port 8080 by default, and you may
change it in env/url_detection.env
```
# set default PostgresSQL user and password
export POSTGRES_USER=YOUR_CUSTOM_USER
export POSTGRES_PASSWORD=YOUR_CUSTOM_PASSWORD

docker-compose up -d
```
Download url data and save it to database. Commonly this is executed 
by cronjob 
```
docker exec url-crawler sh execute.sh
```
