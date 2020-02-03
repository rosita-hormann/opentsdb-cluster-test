#!/bin/bash
docker network create hdfs-net

docker run -d \
	--name zookeeper-node1 \
	--hostname zookeeper-node1 \
	--detach=true \
	--network hdfs-net \
	--env ZOO_MY_ID=1 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888" \
	zookeeper:3.4

docker run -d \
	--name hadoop-master \
	--hostname hadoop-master \
	--network hdfs-net \
	--detach=true \
	newnius/hadoop:2.7.4

docker run -d \
	--name hbase-master \
	--hostname hbase-master \
	--network hdfs-net \
	--detach=true \
	newnius/hbase:1.2.6

docker run -d -p 4242:4242 \
	-e TIMEZONE=America/Santiago \
	-e ZK_QUORUM=hbase-master \
	-e COMPACTION=False \
	--name opentsdb-1 \
	--hostname opentsdb-1 \
	--network hdfs-net \
	olegfedoseev/opentsdb