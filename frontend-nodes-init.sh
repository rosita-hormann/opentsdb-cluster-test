#!/bin/bash

docker run -d -p 4242:4242 \
    -e TIMEZONE=Asia/Novosibirsk \
    -e ZK_QUORUM=hbase-master,hbase-slave1,hbase-slave2,hbase-slave3 \
    -e COMPACTION=False \
    -p 4242:4242 \
  	--name opentsdb-1 \
	  --hostname opentsdb-1 \
	  --network swarm-net \
    olegfedoseev/opentsdb