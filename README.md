### Supported tags and respective ```Dockerfile``` links
* [```1.1.3```,```latest```, (1.1.3/Dockerfile)](https://github.com/jimtonic/opentsdb-docker/blob/2.3_1.2.4/Dockerfile)

## How To Use

Your need a running Cassandra container, that you can link to the KairosDB container.

```
docker run -d --name some_cassandra  -e "CASSANDRA_START_RPC=true" cassandra
```

### 1. Run the image

```
docker run -d --name some_opentsdb --link some_cassandra:cassandra -e "CASSANDRA_HOST_LIST=cassandra:9160" jimtonic/opentsdb
```

Exposed Ports:
* 8083  - KairosDB REST API
