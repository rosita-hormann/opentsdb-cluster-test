#!/bin/bash

# Intento 3

# Intento 2

docker run -d -p 4242:4242 \
	-e TIMEZONE=America/Santiago \
	-e ZK_QUORUM=zk1,zk2,zk3 \
	-e COMPACTION=False \
	--network hdfs-net \
	--name opentsdb-1 \
	--hostname opentsdb-1 \
	olegfedoseev/opentsdb

docker run -d -p 4243:4242 \
	-e TIMEZONE=America/Santiago \
	-e ZK_QUORUM=zk1,zk2,zk3 \
	-e COMPACTION=False \
	--network hdfs-net \
	--name opentsdb-2 \
	--hostname opentsdb-2 \
	olegfedoseev/opentsdb


# # Intento 2

# docker run -d -p 4242:4242 \
# 	-e TIMEZONE=America/Santiago \
# 	-e ZK_QUORUM=hbase-master,hbase-regionserver1 \
# 	-e COMPACTION=False \
# 	--network hdfs-net \
# 	--name opentsdb-1 \
# 	--hostname opentsdb-1 \
# 	olegfedoseev/opentsdb

# docker run -d -p 4243:4242 \
# 	-e TIMEZONE=America/Santiago \
# 	-e ZK_QUORUM=hbase-master,hbase-regionserver1 \
# 	-e COMPACTION=False \
# 	--network hdfs-net \
# 	--name opentsdb-2 \
# 	--hostname opentsdb-2 \
# 	olegfedoseev/opentsdb
#,hbase-regionserver2
##############################################################
# docker run -d -p 4242:4242 \
# 	-e TIMEZONE=America/Santiago \
# 	-e ZK_QUORUM=hbase-master,hbase-slave1,hbase-slave2,hbase-slave3 \
# 	-e COMPACTION=False \
# 	--name opentsdb-1 \
# 	--hostname opentsdb-1 \
# 	--network hdfs-net \
# 	olegfedoseev/opentsdb

# docker run -d -p 4243:4242 \
# 	-e TIMEZONE=America/Santiago \
# 	-e ZK_QUORUM=hbase-master,hbase-slave1,hbase-slave2,hbase-slave3 \
# 	-e COMPACTION=False \
# 	--name opentsdb-2 \
# 	--hostname opentsdb-2 \
# 	--network hdfs-net \
# 	olegfedoseev/opentsdb