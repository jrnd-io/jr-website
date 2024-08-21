---
# Title, summary, and page position.
linktitle: Other producers
summary: Learn how to use JR to stream data to other outputs
weight: 400
#icon: book
icon_pack: fas

# Page metadata.
title: Other producers
date: '2023-12-06T00:00:00Z'
type: book # Do not modify.
---

## Use JR to stream data to external stores

You can use JR to stream data to many different stores, not only to standard output and Kafka. 
JR supports natively several different producers: you can also easily `jr run template | CLI-tool-to-your-store` if your preferred store is not natively supported. 

Look at this [Postgres recipe](https://jrnd.io/docs/recipes/#insert-data-into-a-rdbms) for example: though Postgres is not natively supported, it's pretty easy to use JR to produce data for it.

If you think that your preferred store should be supported, why not [implement it](#implementing-other-producers)? Or just open up [an issue](https://github.com/jrnd-io/jr/issues) and we'll do that for you!

```bash
jr producer list
```

- Console * (default, but you can also make it explicit with `--output = stdout`)
- [Kafka](https://jrnd.io/docs/kafka) (`--output = kafka`)
- [HTTP](#http-producer) (`--output = http`)
- [Redis](#redis-producer) (`--output = redis`)
- [Mongodb](#mongodb-producer) (`--output = mongo`)
- [Elastic](#elastic-search-producer) (`--output = elastic`)
- [S3](#aws-s3-producer) (`--output = s3`)
- [GCS](#google-cloud-storage-producer) (`--output = gcs`)
- [AZBlobStorage](#azure-blob-storage-producer) (`--output = azblobstorage`)
- [AZCosmosDB](#azure-cosmos-db-producer) (`--output = azcosmosdb`)
- [Cassandra](#cassandra-producer) (`--output = cassandra`)
- [LUA Script](#lua-script) (`--output = luascript`)
- [AWS DynamoDB](#aws-dynamodb) (`--output = awsdynamodb`)

to use an output, just set the corresponding value in `--output`

Every output needs also a corresponding configuration.

## AWS S3 Producer

`--output = s3`

`--s3Config` parameter to add a S3 configuration

Configure your AWS credentials properly:

```bash
$ export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
$ export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
```

Amazon S3 Configuration in `config.json`

```json
{
  "aws_region": "<aws-region>",
  "bucket": "<s3-bucket-name>"
}
```

## Azure Blob Storage Producer

`--output = azblobstorage`

`--azBlobStorageConfig` parameter to add a Azure Blob Storage configuration 

Azure Blob Storge Configuration exampele:

```json
{
    "account_name": "<account name>",
    "primary_account_key":"<primary account key>",
    "container":{
        "name": "<container name>",
        "create": false
    }

}
```

## Azure Cosmos DB producer

`--output = azcosmosdb`

`--azCosmosDBConfig` parameter to add a Azure Cosmos DB configuration

```json
{
   "endpoint": "https://<account>.documents.azure.com:443/",
   "primary_account_key": "<security primary access key>",
   "database": "<database name>",
   "container":"<container name>",
   "partition_key": "<name of partition key field>"
}
```

## Cassandra Producer

`--output = cassandra`

`--cassandraConfig` parameter to add a Cassandra configuration

```json
{
  "hosts":["host1:port1","host2:port2",...],
  "keyspace": "<keyspacename>",
  "table":"<table_name>",
  "username": "<username>",
  "password": "<password>",
  "timeout": "<timeout>",
  "consistencyLevel": "<consistencyLevel>"
}
```

## Elastic Search Producer

`--output = elastic`

`--elasticConfig` parameter to add an Elastic Search configuration

```json
{
  "es_uri": "http://<host>:<port>",
  "index": "<index_name>",
  "username": "<username>",
  "password": "<password>"
}
```

## Google Cloud Storage Producer

`--output = gcs`

`--gcsConfig` parameter to add a GCS configuration

Current implementation uses Google Application Default Credentials to authorize and authenticate the client.
More information about Application Default Credentials and how to enable is at:
https://developers.google.com/identity/protocols/application-default-credentials.

Google GCS Configuration example:

```json
{
  "bucket_name": "<gcs-bucket-name>"
}
```

## HTTP Producer

`--output = http`

`--httpConfig` parameter to add a HTTP configuration (default `"./httpConfig.json"`)

Usage:

```bash 
jr run net_device --output http --httpConfig ./httpconfig.json
```

where httpconfig.json is something like:

```json
{
    "endpoint": {
        "url": "https://jr.io",
        "method": "POST",
        "timeout": "10s"
    },
    "session":{
        "use_cookie_jar": false
    },
    "error_handling":{
        "expect_status_code": 200,
        "ignore_status_code": false,
    },
    "headers":{
        "header01":"value01",
        "header02":"value02",
    },
    "tls":{
        "insecure_skip_verify": false,
        "cert_file": "/path/to/cert_file",
        "key_file": "/path/to/key_file",
        "root_ca_file": "/path/to/root_ca_file"
    },
    "authentication":{
        "type": "basic",
        "basic":{
            "username": "user",
            "password": "password",
        }
    }
}
```

## MongoDB producer

`--output = mongo`

`--mongoConfig` parameter to add a MongoDB/Atlas configuration

MongoDB Configuration:

```json
{
"mongo_uri": "mongodb://<host>:<port>",
"database": "<database>",
"collection": "<collection>",
"username": "<username>",
"password": "<password>"
}
```

MongoDB Atlas Configuration:

```json
{
  "mongo_uri": "mongodb+srv://<username>:<password>@<cluster-address>/<database-name>?retryWrites=true&w=majority",
  "database": "<database>",
  "collection": "<collection>"
}
```

## Redis Producer

`--output = redis`

`--redisConfig` parameter to add a Redis configuration

```json
{
  "host": "<redis_host>",
  "port": "<redis_host_port>",
  "username": "<username>",
  "password": "<password>"
}
```

## LUA Script

An interesting and flexible JR output is LUA scripting. 
With this producer, you can basically do whatever you want, directly scripting JR with [LUA](https://lua.org).

This producer uses the [GOPHER Lua plugin](https://github.com/yuin/gopher-lua) nad includes by default all the [GOPHER LUA libs](https://github.com/vadv/gopher-lua-libs)  

To test it:

`jr run net_device -o luascript  --luascriptConfig ./lua/luaConfig.json`

where the `luaConfig.json` contains

```json
{
      "script_file":"~/examples/http.lua"
}

```

the `http.lua` in this example just POST the value on a URL.

```lua
local http = require("http")
local client = http.client()
local request = http.request("POST","http://localhost:8085",v)
local result, err = client:do_request(request)
if err then
    error(err)
end
if not (result.code == 200) then
    error("code")
end
```

## AWS Dynamo DB



## Implementing other Producers

To add another store producer, you have to implement this interface

```go
type Producer interface {
	Produce(k []byte, v []byte, o any)
	io.Closer
}
```
