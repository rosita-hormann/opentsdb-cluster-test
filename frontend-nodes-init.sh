#!/bin/bash

docker run -d -p 4242:4242 \
	-e TIMEZONE=America/Santiago \
	-e ZK_QUORUM=hbase-master,hbase-slave1,hbase-slave2,hbase-slave3 \
	-e COMPACTION=False \
	--name opentsdb-1 \
	--hostname opentsdb-1 \
	--network hdfs-net \
	olegfedoseev/opentsdb

docker run -d -p 4243:4242 \
	-e TIMEZONE=America/Santiago \
	-e ZK_QUORUM=hbase-master,hbase-slave1,hbase-slave2,hbase-slave3 \
	-e COMPACTION=False \
	--name opentsdb-2 \
	--hostname opentsdb-2 \
	--network hdfs-net \
	olegfedoseev/opentsdb