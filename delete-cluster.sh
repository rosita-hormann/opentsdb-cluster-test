#!/bin/bash

#Stopping containers

docker stop opentsdb-1 opentsdb-2

docker stop hbase-master hbase-slave1 hbase-slave2 hbase-slave3

docker stop hadoop-master hadoop-slave1 hadoop-slave2 hadoop-slave3

docker stop zookeeper-node1 zookeeper-node2 zookeeper-node3


# Remove all docker containers that are stopped
docker container rm $(docker container ls -aq)

#Removing containers
docker rm opentsdb-1 opentsdb-2

docker rm hbase-master hbase-slave1 hbase-slave2 hbase-slave3

docker rm hadoop-master hadoop-slave1 hadoop-slave2 hadoop-slave3

docker rm zookeeper-node1 zookeeper-node2 zookeeper-node3

#Removing network
docker network rm hdfs-net