---
# Title, summary, and page position.
linktitle: Kafka
summary: Learn how to use JR to stream data to Kafka
weight: 2
#icon: book
icon_pack: fas

# Page metadata.
title: Kafka
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

JR has been built with [Apache Kafka](https://kafka.apache.org/) in mind since the inception, so the Kafka support is pretty advanced.

### Writing data to Apache Kafka

Just use the `--output kafka` (which defaults to `console`) flag and `--topic` flag to indicate the topic name:

```bash
jr run net_device -n 5 -f 500ms -o kafka -t test
```

If you don't specify a key, the string "key" will be used for each record.
Using `--key` you can use a template for the key, embedding it directly in the command:

For example:
```bash
jr run -k '{{key "KEY" 20}}' -f 1s -d 10s net_device -o kafka -t test
```
Another example:
```bash 
jr run -k '{{randoms "ONE|TWO|THREE"}}' -f 1s -d 10s net_device -o kafka -t test
```

### Autocreate topics

Topics autocreation is disabled in Confluent Cloud.
If you are really lazy you can use the `-a` option, so JR will create the topic for you.

```bash
jr run -a -k '{{randoms "ONE|TWO|THREE"}}' -f 1s -d 10s net_device -o kafka -t mynewtopic
```

Alternatively, you can also create it explicitly from JR:

```bash
jr createTopic mynewtopic
```
If you want to specify number of partitions and replication Factor you can use the `-p` and `-r` flags:

```bash
jr createTopic mynewtopic -p 10 -r 2
```

