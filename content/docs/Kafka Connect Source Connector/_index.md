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

Additional details are listed in the [official repository](https://github.com/jrnd-io/jr-kafka-connect-source).
