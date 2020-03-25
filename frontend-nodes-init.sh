#!/bin/bash
docker run -d -p 4242:4242 \
	--name opentsdb-1 \
	--hostname opentsdb-1 \
	--network hdfs-net \
	lilrose/opentsdb:0.1

docker run -d -p 4243:4242 \
	--name opentsdb-2 \
	--hostname opentsdb-2 \
	--network hdfs-net \
	lilrose/opentsdb:0.1