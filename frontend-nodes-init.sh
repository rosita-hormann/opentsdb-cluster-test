#!/bin/bash

# OpenTSDB nodes:
docker run -d -p 4242:4242 --name opentsdb-1 --hostname opentsdb-1 --network hdfs-net lilrose/opentsdb:0.1

docker run -d -p 4243:4242 --name opentsdb-2 --hostname opentsdb-2 --network hdfs-net lilrose/opentsdb:0.1

# Nginx:
docker run -p 8080:8080 --name nginx-app-opentsdb --network hdfs-net -v /home/lilrose/repos/opentsdb-cluster-connection/nginx.conf:/etc/nginx/nginx.conf:ro nginx