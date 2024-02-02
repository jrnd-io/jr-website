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

Every output needs also a corresponding configuration.
