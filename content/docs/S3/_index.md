---
# Title, summary, and page position.
linktitle: Amazon S3
summary: Learn how to use JR to stream data to Amazon S3
weight: 3
#icon: book
icon_pack: fas

# Page metadata.
title: S3
date: '2023-05-23T00:00:00Z'
type: book # Do not modify.
---

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
