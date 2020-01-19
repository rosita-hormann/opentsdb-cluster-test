#!/bin/bash

# Network

docker network create hdfs-net

# ZooKeeper nodes:

docker run -d \
	--name zookeeper-node1 \
	--hostname zookeeper-node1 \
	--detach=true \
	--replicas 1 \
	--network hdfs-net \
	--endpoint-mode dnsrr \
	--env ZOO_MY_ID=1 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/zookeeper/data/node1,target=/data \
	--mount type=bind,source=/data/zookeeper/logs/node1,target=/datalog \
	zookeeper:3.4

docker run -d \
	--name zookeeper-node2 \
	--hostname zookeeper-node2 \
	--detach=true \
	--replicas 1 \
	--network hdfs-net \
	--endpoint-mode dnsrr \
	--env ZOO_MY_ID=2 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/zookeeper/data/node2,target=/data \
	--mount type=bind,source=/data/zookeeper/logs/node3,target=/datalog \
	zookeeper:3.4

docker run -d \
	--name zookeeper-node3 \
	--hostname zookeeper-node3 \
	--replicas 1 \
	--detach=true \
	--network hdfs-net \
	--endpoint-mode dnsrr \
	--env ZOO_MY_ID=3 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/zookeeper/data/node3,target=/data \
	--mount type=bind,source=/data/zookeeper/logs/node3,target=/datalog \
	zookeeper:3.4

# HDFS (Hadoop) servers:
docker run -d \
	--name hadoop-master \
	--hostname hadoop-master \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/master,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/master,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4

# Notice: --endpoint-mode dnsrr is required

docker run -d \
	--name hadoop-slave1 \
	--hostname hadoop-slave1 \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave1,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave1,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4

docker run -d \
	--name hadoop-slave2 \
	--hostname hadoop-slave2 \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave2,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave2,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4

docker run -d \
	--name hadoop-slave3 \
	--hostname hadoop-slave3 \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave3,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave3,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4

# HBase nodes:
docker run -d \
	--name hbase-master \
	--hostname hbase-master \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/master,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6

docker run -d \
	--name hbase-slave1 \
	--hostname hbase-slave1 \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/slave1,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6

docker run -d \
	--name hbase-slave2 \
	--hostname hbase-slave2 \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/slave2,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6

docker run -d \
	--name hbase-slave3 \
	--hostname hbase-slave3 \
	--network hdfs-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/slave3,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6