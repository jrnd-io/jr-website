---
# Title, summary, and page position.
linktitle: Output
summary: Learn how to use JR to stream data to other outputs
weight: 3
#icon: book
icon_pack: fas

# Page metadata.
title: Output
date: '2023-05-23T00:00:00Z'
type: book # Do not modify.
---

## Use JR to stream data to MongoDB

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
## Use JR to stream data to Redis

TBD

## Use JR to stream data to Amazon S3

Configure your AWS credentials properly, either by setting environment:

```bash
$ export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
$ export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
```

## Use JR to stream data to Elastic Search

Elastic Configuration:

```json
{
  "es_uri": "http://<host>:<port>",
  "index": "<index_name>",
  "username": "<username>",
  "password": "<password>"
}
```
## Use JR to stream data to Amazon S3

Configure your AWS credentials properly, either by setting environment:

```bash
$ export AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
$ export AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
```

Amazon S3 Configuration:

```json
{
  "aws_region": "<aws-region>",
  "bucket": "<s3-bucket-name>"
}
```
