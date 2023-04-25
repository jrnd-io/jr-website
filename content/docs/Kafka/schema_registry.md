---
title: Schema Registry
linktitle: Schema Registry
type: book
date: '2023-04-17T00:00:00Z'
# Prev/next pager order (if `docs_section_pager` enabled in `params.toml`)
weight: 2
---

### Confluent Schema Registry support

There is also support for Confluent Schema Registry.
At the moment `json-schema`, `avro-generic` and `avro` are all supported.

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

### Using JR to pipe data to **KCAT**

Another simple way of streaming to Apache Kafka is to use [kcat](https://github.com/edenhill/kcat) in conjunction with JR.
JR supports **kcat** out of the box. Using the `--kcat` flag the standard output will be formatted with K,V on a single line.

`--kcat` it's a shorthand equivalent for `--output stdout --outputTemplate '{{.K}},{{.V}}' --oneline`


```bash
jr run -k '{{randoms "ONE|TWO|THREE"}}' -f 1s -d 5s net_device --kcat | kcat -F kafka/config.properties -K , -P -t test
```
