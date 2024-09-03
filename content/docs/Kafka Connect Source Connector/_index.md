---
# Title, summary, and page position.
linktitle: Kafka Connect Source Connector
weight: 550
#icon: book
icon_pack: fas

# Page metadata.
title: Kafka Connect Source Connector
date: '2024-09-02T00:00:00Z'
type: book # Do not modify.
---

## Kafka Connect Source Connector

JR provides a Source Connector for Apache Kafka Connect.
This is useful if you are migrating from [Kafka Connect Datagen](https://github.com/confluentinc/kafka-connect-datagen)

JR Source Connector can be configured with:

 - _template_: A valid JR existing template name. For a list of available templates see: https://jrnd.io/docs/#listing-existing-templates
 - _topic_: target topic
 - _frequency_: Repeat the creation of a random message every `frequency` milliseconds.
 - _objects_: Number of objects to create at every run. Default is 1.
 - _key_field_: Name for object key field, for example ID. This is an OPTIONAL config, if not set, objects will be created without a key.

Following example is for a JR connector job using template _net_device_ and producing 5 new random messages to _net_device_ topic every 5 seconds.

```json
{
    "name" : "jr-quickstart",
    "config": {
        "connector.class" : "io.jrnd.kafka.connect.connector.JRSourceConnector",
        "template" : "net_device",
        "topic": "net_device",
        "frequency" : 5000,
        "objects": 5,
        "tasks.max": 1
    }
}
```

```
kafka-console-consumer --bootstrap-server localhost:9092 --topic net_device --from-beginning --property print.key=true
null	{"VLAN": "BETA","IPV4_SRC_ADDR": "10.1.98.6","IPV4_DST_ADDR": "10.1.185.254","IN_BYTES": 1756,"FIRST_SWITCHED": 1724287965,"LAST_SWITCHED": 1725353374,"L4_SRC_PORT": 80,"L4_DST_PORT": 443,"TCP_FLAGS": 0,"PROTOCOL": 3,"SRC_TOS": 190,"SRC_AS": 1,"DST_AS": 1,"L7_PROTO": 81,"L7_PROTO_NAME": "TCP","L7_PROTO_CATEGORY": "Transport"}
null	{"VLAN": "BETA","IPV4_SRC_ADDR": "10.1.95.4","IPV4_DST_ADDR": "10.1.239.68","IN_BYTES": 1592,"FIRST_SWITCHED": 1722620372,"LAST_SWITCHED": 1724586369,"L4_SRC_PORT": 443,"L4_DST_PORT": 22,"TCP_FLAGS": 0,"PROTOCOL": 0,"SRC_TOS": 165,"SRC_AS": 3,"DST_AS": 1,"L7_PROTO": 443,"L7_PROTO_NAME": "HTTP","L7_PROTO_CATEGORY": "Transport"}
null	{"VLAN": "DELTA","IPV4_SRC_ADDR": "10.1.126.149","IPV4_DST_ADDR": "10.1.219.156","IN_BYTES": 1767,"FIRST_SWITCHED": 1721931269,"LAST_SWITCHED": 1724976862,"L4_SRC_PORT": 631,"L4_DST_PORT": 80,"TCP_FLAGS": 0,"PROTOCOL": 1,"SRC_TOS": 139,"SRC_AS": 0,"DST_AS": 1,"L7_PROTO": 22,"L7_PROTO_NAME": "TCP","L7_PROTO_CATEGORY": "Application"}
```

Following example is for a JR connector job using template _users_ and producing 5 new random messages to _users_ topic every 5 seconds, using a message key field named USERID with a random integer value.

```json
{
    "name" : "jr-keys-quickstart",
    "config": {
        "connector.class" : "io.jrnd.kafka.connect.connector.JRSourceConnector",
        "template" : "users",
        "topic": "users",
        "frequency" : 5000,
        "objects": 5,
        "key_field": "USERID",
        "tasks.max": 1
    }
}
```

```
kafka-console-consumer --bootstrap-server localhost:9092 --topic users --from-beginning --property print.key=true
{"USERID":2}	{    "registertime": 1493746876617,    "userid": {"USERID":2},    "regionid": "Region_6",    "gender": "FEMALE"}
{"USERID":81}	{    "registertime": 1506768044762,    "userid": {"USERID":81},    "regionid": "Region_1",    "gender": "MALE"}
{"USERID":74}	{    "registertime": 1492137303816,    "userid": {"USERID":74},    "regionid": "Region_4",    "gender": "FEMALE"}
{"USERID":99}	{    "registertime": 1517673374519,    "userid": {"USERID":99},    "regionid": "Region_1",    "gender": "FEMALE"}
{"USERID":32}	{    "registertime": 1510487727496,    "userid": {"USERID":32},    "regionid": "Region_8",    "gender": "OTHER"}
{"USERID":57}	{    "registertime": 1515149660236,    "userid": {"USERID":57},    "regionid": "Region_3",    "gender": "FEMALE"}
{"USERID":56}	{    "registertime": 1508189261996,    "userid": {"USERID":56},    "regionid": "Region_2",    "gender": "MALE"}
```

Additional details are listed in the [official repository](https://github.com/jrnd-io/jr-kafka-connect-source).
