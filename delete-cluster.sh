#!/bin/bash

#Stopping containers

docker stop opentsdb-1
docker stop opentsdb-2

docker stop hbase-master
docker stop hbase-slave1
docker stop hbase-slave2
docker stop hbase-slave3

docker stop hadoop-master
docker stop hadoop-slave1
docker stop hadoop-slave2
docker stop hadoop-slave3

docker stop zookeeper-node1
docker stop zookeeper-node2
docker stop zookeeper-node3

#Removing containers
docker rm opentsdb-1
docker rm opentsdb-2

docker rm hbase-master
docker rm hbase-slave1
docker rm hbase-slave2
docker rm hbase-slave3

docker rm hadoop-master
docker rm hadoop-slave1
docker rm hadoop-slave2
docker rm hadoop-slave3

docker rm zookeeper-node1
docker rm zookeeper-node2
docker rm zookeeper-node3

#Removing network
docker network rm hdfs-net