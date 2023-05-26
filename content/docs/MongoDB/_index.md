---
# Title, summary, and page position.
linktitle: MongoDB
summary: Learn how to use JR to stream data to MongoDB
weight: 3
#icon: book
icon_pack: fas

# Page metadata.
title: MongoDB
date: '2023-05-23T00:00:00Z'
type: book # Do not modify.
---

## Use JR to stream data to MongoDB

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
