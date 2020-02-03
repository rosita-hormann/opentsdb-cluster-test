#!/bin/bash

# Version 2:

docker stop opentsdb-1
docker stop opentsdb-2

# docker stop hbase-master
# docker stop hbase-regionserver1
# docker stop hbase-regionserver2

docker stop master
docker stop regionserver

docker stop zk1
docker stop zk2
docker stop zk3

docker rm opentsdb-1
docker rm opentsdb-2

# docker rm hbase-master
# docker rm hbase-regionserver1
# docker rm hbase-regionserver2

docker rm master
docker rm regionserver

docker rm zk1
docker rm zk2
docker rm zk3

docker network rm hdfs-net

###################################
# #Stopping containers

# docker stop opentsdb-1
# docker stop opentsdb-2

# docker stop hbase-master
# docker stop hbase-slave1
# docker stop hbase-slave2
# docker stop hbase-slave3

# docker stop hadoop-master
# docker stop hadoop-slave1
# docker stop hadoop-slave2
# docker stop hadoop-slave3

# docker stop zookeeper-node1
# docker stop zookeeper-node2
# docker stop zookeeper-node3

# #Removing containers
# docker rm opentsdb-1
# docker rm opentsdb-2

# docker rm hbase-master
# docker rm hbase-slave1
# docker rm hbase-slave2
# docker rm hbase-slave3

# docker rm hadoop-master
# docker rm hadoop-slave1
# docker rm hadoop-slave2
# docker rm hadoop-slave3

# docker rm zookeeper-node1
# docker rm zookeeper-node2
# docker rm zookeeper-node3

# #Removing network
# docker network rm hdfs-net