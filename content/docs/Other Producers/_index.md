---
# Title, summary, and page position.
linktitle: Other Producers
summary: Learn how to use JR to stream data to other outputs
weight: 400
#icon: book
icon_pack: fas

# Page metadata.
title: Other Producers
date: '2023-12-06T00:00:00Z'
type: book # Do not modify.
---

## Use JR to stream data to external stores

You can use JR to stream data to many different stores, not only Kafka.

```bash
jr producer list
```

You'll get an output similar to:
```
List of JR emitters:

Console * (--output = stdout)
Kafka (--output = kafka)
Redis (--output = redis)
Mongodb (--output = mongo)
Elastic (--output = elastic)
S3 (--output = s3)
GCS (--output = gcs)
```
to use an output, just set the corresponding value in `--output`

Every output needs also a corresponding configuration

## MongoDB

`--mongoConfig` parameter to add a MongoDB/Atlas configuration (default `"./mongoDB/config.json"`)

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
## Redis

`--redisConfig` parameter to add a Redis configuration (default `"./redis/config.json"`)

```json
{
  "host": "<redis_host>",
  "port": "<redis_host_port>",
  "username": "<username>",
  "password": "<password>"
}
```

## Elastic Search

Elastic Configuration:

`--elasticConfig` parameter to add an Elastic Search configuration (default `"./elastic/config.json"`)

```json
{
  "es_uri": "http://<host>:<port>",
  "index": "<index_name>",
  "username": "<username>",
  "password": "<password>"
}
```

## Amazon S3

`--s3Config` parameter to add an S3 configuration (default `"./s3/config.json"`)

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

## Google GCS

`--gcsConfig` parameter to add a GCS configuration (default `"./gcs/config.json"`)

Current implementation uses Google Application Default Credentials to authorize and authenticate the client.
More information about Application Default Credentials and how to enable is at:
https://developers.google.com/identity/protocols/application-default-credentials.

Google GCS Configuration in `config.json`

```json
{
  "bucket_name": "<gcs-bucket-name>"
}
```
