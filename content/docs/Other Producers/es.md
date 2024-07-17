---
# Title, summary, and page position.
linktitle: Elastic Search
weight: 140
#icon: book
icon_pack: fas

# Page metadata.
title: Elastic Search
date: '2024-02-01T00:00:00Z'
type: book # Do not modify.
---

Use with `--output = elastic`


`--elasticConfig` parameter to add an Elastic Search configuration (default `"./elastic/config.json"`)

```json
{
  "es_uri": "http://<host>:<port>",
  "index": "<index_name>",
  "username": "<username>",
  "password": "<password>"
}
```
