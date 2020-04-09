https://hub.docker.com/r/newnius/hbase

http://opentsdb.net/docs/build/html/installation.html

http://opentsdb.net/docs/build/html/user_guide/configuration.html

## Zookeeper

Check zookeeper node status:
```shell
docker exec zookeeper-node1 ./bin/zkServer.sh status /conf/zoo.cfg

# Or you can telnet on zookeeper node and execute stats comand
telnet [ip-zookeeper-node] 2181
stats
```

## To-do list:
- add python script to connect to OpenTSDB and erase Javascript scripts
- write a short Introduction
- Basics about Hadoop, HBase, Zookeeper, OpenTSDB
- explain how to initialite backend nodes
- explain how to initialite frontend nodes and connection
- explain how to load-balance with Nginx and connection
- conclutions
- Index
- final fixes