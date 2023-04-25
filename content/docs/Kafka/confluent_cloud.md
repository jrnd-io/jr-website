---
title: Confluent Cloud
linktitle: Confluent Cloud
type: book
date: '2023-04-17T00:00:00Z'
# Prev/next pager order (if `docs_section_pager` enabled in `params.toml`)
weight: 1
---

## Configuring Apache Kafka

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
