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