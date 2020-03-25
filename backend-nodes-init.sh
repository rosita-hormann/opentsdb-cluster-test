#!/bin/bash

# Network

docker network create hdfs-net

# ZooKeeper nodes:

docker run -d \
	--name zookeeper-node1 \
	--restart always \
	--network hdfs-net \
	--hostname zookeeper-node1 \
	--env ZOO_MY_ID=1 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	zookeeper:3.4

docker run -d \
	--name zookeeper-node2 \
	--restart always \
	--network hdfs-net \
	--hostname zookeeper-node2 \
	--env ZOO_MY_ID=2 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	zookeeper:3.4

docker run -d \
	--name zookeeper-node3 \
	--restart always \
	--network hdfs-net \
	--hostname zookeeper-node3 \
	--env ZOO_MY_ID=3 \
	--env ZOO_SERVERS="server.1=zookeeper-node1:2888:3888 server.2=zookeeper-node2:2888:3888 server.3=zookeeper-node3:2888:3888" \
	zookeeper:3.4

# HDFS (Hadoop) servers:
docker run -d \
	--name hadoop-master \
	--restart always \
	--network hdfs-net \
	--hostname hadoop-master \
	-p 16010:16010 \
	newnius/hadoop:2.7.4

docker run -d \
	--name hadoop-slave1 \
	--restart always \
	--network hdfs-net \
	--hostname hadoop-slave1 \
	newnius/hadoop:2.7.4

docker run -d \
	--name hadoop-slave2 \
	--restart always \
	--network hdfs-net \
	--hostname hadoop-slave2 \
	newnius/hadoop:2.7.4

docker run -d \
	--name hadoop-slave3 \
	--restart always \
	--network hdfs-net \
	--hostname hadoop-slave3 \
	newnius/hadoop:2.7.4

# Now we restart Hadoop master node
docker exec -it hadoop-master /bin/bash

# stop HDFS services
sbin/stop-dfs.sh

# format HDFS meta data
bin/hadoop namenode -format

# restart HDFS services
sbin/start-dfs.sh

# Then you must exit of hadoop-master container

# HBase nodes:

	# --replicas 1 \
	# --detach=true \
	# --endpoint-mode dnsrr \
	# --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	# --mount type=bind,source=/data/hbase/config,target=/config/hbase \
	# --mount type=bind,source=/data/hbase/logs/master,target=/usr/local/hbase/logs \
docker run -d \
	--name hbase-master \
	--restart always \
	--network hdfs-net \
	--hostname hbase-master \
	newnius/hbase:1.2.6

docker run -d \
	--name hbase-slave1 \
	--restart always \
	--network hdfs-net \
	--hostname hbase-slave1 \
	newnius/hbase:1.2.6

docker run -d \
	--name hbase-slave2 \
	--restart always \
	--network hdfs-net \
	--hostname hbase-slave2 \
	newnius/hbase:1.2.6

docker run -d \
	--name hbase-slave3 \
	--restart always \
	--network hdfs-net \
	--hostname hbase-slave3 \
	newnius/hbase:1.2.6
# First we copy create_table.sh (from OpenTSDB build) on the hbase-master container
docker cp create_table.sh hbase-master:create_table.sh

# Now we start HBase master node
docker exec -it hbase-master /bin/bash

# inside hbase-master container
bin/start-hbase.sh
env COMPRESSION=NONE HBASE_HOME=/usr/local/hbase /create_table.sh