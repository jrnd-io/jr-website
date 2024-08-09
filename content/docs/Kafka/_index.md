---
# Title, summary, and page position.
linktitle: Kafka
summary: Learn how to use JR to stream data to Kafka
weight: 300
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

If you don't specify a key, ta null key will be used for each record.
Using `--key` you can use a template for the key, to be embedded directly in the command:

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

## KCat (was: Kafkacat)

### Using JR to pipe data to **kcat**

If you don't want to use the JR embedded Kafka support, you can use the wonderful [kcat](https://github.com/edenhill/kcat)
CLI tool together with JR.

JR supports **kcat** out of the box. Using the `--kcat` flag the standard output will be formatted with K,V on a single line:
`--kcat` in fact it's only a shorthand equivalent for `--output stdout --outputTemplate '{{.K}},{{.V}}' --oneline`

```bash
jr run -k '{{randoms "ONE|TWO|THREE"}}' -f 1s -d 5s net_device --kcat | kcat -F kafka/config.properties -K , -P -t test
```

## Confluent CLoud

First thing to do is to create a Kafka cluster and relative kafka.properties file. The easiest way to do that is to use [Confluent Cloud]("https://confluent.cloud/").

Here we document three different ways of doing that. Choose the one that fits you better!

### 1. Confluent Cloud and downloading the config file

Just create a basic (free!) Cluster with the web console in [Confluent Cloud]("https://confluent.cloud/") and
copy-paste the configuration in the HOME > ENVIRONMENTS > YOUR ENVIRONMENT > YOUR CLUSTER > CLIENTS > New Client section.

### 2. Confluent Cloud and config file via Confluent CLI

You can use the [confluent CLI]("https://docs.confluent.io/confluent-cli/current/overview.html") to create a cluster and
the configuration in a programmatic way:

Config your vars as you see fit, for example:
```bash
export CONFLUENT_CLUSTER_NAME=jr-test
export CONFLUENT_CLUSTER_CLOUD_PROVIDER=aws
export CONFLUENT_CLUSTER_REGION=eu-west-1 
```
Then execute the following commands

```bash

confluent login --save

OUTPUT=$(confluent kafka cluster create "$CONFLUENT_CLUSTER_NAME" --cloud $CONFLUENT_CLUSTER_CLOUD_PROVIDER --region $CONFLUENT_CLUSTER_REGION --output json 2>&1)
(($? != 0)) && { echo "$OUTPUT"; exit 1; }
CONFLUENT_CLUSTER_ID=$(echo "$OUTPUT" | jq -r .id)
confluent kafka cluster use $CLUSTER 2>/dev/null
echo "Cluster $CONFLUENT_CLUSTER_NAME created, Id: $CONFLUENT_CLUSTER_ID"

confluent api-key create --resource $CONFLUENT_CLUSTER_ID

OUTPUT=$(confluent api-key create --resource $CONFLUENT_CLUSTER_ID -o json)
CONFLUENT_CLUSTER_API_KEY=$(echo "$OUTPUT" | jq -r ".api_key")
CONFLUENT_CLUSTER_API_SECRET=$(echo "$OUTPUT" | jq -r ".api_secret")

echo "API KEY:SECRET  -> $CONFLUENT_CLUSTER_API_KEY:$CONFLUENT_CLUSTER_API_SECRET"

confluent kafka topic create test --cluster $CONFLUENT_CLUSTER_ID

confluent kafka client-config create go --cluster $CONFLUENT_CLUSTER_ID --api-key $CONFLUENT_CLUSTER_API_KEY --api-secret $CONFLUENT_CLUSTER_API_SECRET 1> kafka/config.properties 2>&1
```

### 3 An existing Kafka cluster & manually creating config file

If you have an existing cluster, just fill the fields in the provided `kafka/config.properties.example`

```properties
# Kafka configuration
# https://github.com/confluentinc/librdkafka/blob/master/CONFIGURATION.md

bootstrap.servers=
security.protocol=SASL_SSL
sasl.mechanisms=PLAIN
sasl.username=
sasl.password=
compression.type=gzip
compression.level=9
# statistics.interval.ms=1000
```

## Confluent Schema Registry support

There is also support for Confluent Schema Registry.
At the moment `json-schema` and `avro` are supported.

To use Confluent Schema registry you need first to fill the `registry.properties` provided example with the needed link and user/pwd:

```properties
schemaRegistryURL=https://blabla.europe-west3.gcp.confluent.cloud
schemaRegistryUser=blablabla-saslkey
schemaRegistryPassword=blablabla-saslpwd
```
then use the `--schema` and the `--serializer` flags

Example usage:
```bash
jr run user -o kafka -t topic1 -s --serializer avro-generic
```
or
```bash
jr run net_device -o kafka -t topic2 -s --serializer json-schema
```
Remember that once you run these commands, `topic1` will be associated with an avro generic schema representing an user
object, and `topic2` with a json-schema representing a net_device object.
You can manage/evolve the schemas directly into [Confluent Cloud]("https://confluent.cloud/")

### Support for Client-Side Field Level Encryption on Confluent Cloud (CSFLE)

JR supports end to end (E2E) encryption for Confluent Cloud.

In order to use the functionality, first follow the official documentation on Confluent Cloud for prerequisites and configuration:
https://docs.confluent.io/cloud/current/security/encrypt/csfle/overview.html

After setup accordingly with the documentation, you can then enable CSFLE in JR simply filling those properties in `registry.properties`:

```properties
kekName=a name identifying the key encryption key 
kmsType=valid options are "aws-kms" or "azure-kms" or "gcp-kms"
kmsKeyID=id of the kek
```

In order to use CSFLE, you need an AVRO schema with fields marked as sensitive (PII).
The default schemas in JR are located in `pks/types` folder: at the moment the ones containing PII fields are:

- `payment_credit_card.avsc`, field `card_number`

If you need additional PII fields or additional templates with PII, you should update `avsc` files in `pkg/types` folder and then recompile JR.

