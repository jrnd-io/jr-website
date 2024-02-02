---
# Title, summary, and page position.
linktitle: MongoDB
weight: 120
#icon: book
icon_pack: fas

# Page metadata.
title: MongoDB
date: '2024-02-01T00:00:00Z'
type: book # Do not modify.
---

Use with `--output = mongo`


`--mongoConfig` parameter to add a MongoDB/Atlas configuration (default `"./mongoDB/config.json"`)

MongoDB Configuration:

```json
{
"mongo_uri": "mongodb://<host>:<port>",
"database": "<database>",
"collection": "<collection>",
"username": "<username>",
"password": "<password>"
}
```

MongoDB Atlas Configuration:

```json
{
  "mongo_uri": "mongodb+srv://<username>:<password>@<cluster-address>/<database-name>?retryWrites=true&w=majority",
  "database": "<database>",
  "collection": "<collection>"
}
```
