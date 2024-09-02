---
# Title, summary, and page position.
linktitle: Source Connector for Kafka Connect
weight: 650
#icon: book
icon_pack: fas

# Page metadata.
title: Source Connector for Kafka Connect
date: '2024-09-02T00:00:00Z'
type: book # Do not modify.
---

## Source Connector for Kafka Connect

JR provides a Source Connector for Apache Kafka Connect, generating random data and writes it into a Kafka topic. 

JR Source Connector can be configured with:

 - _template_: A valid JR existing template name. For a list of available templates see: https://jrnd.io/docs/#listing-existing-templates
 - _topic_: target topic
 - _frequency_: Repeat the creation of a random message every X milliseconds.
 - _objects_: Number of objects to create at every run. Default is 1.

Additional details are listed in the [official repository](https://github.com/jrnd-io/jr-kafka-connect-source).
