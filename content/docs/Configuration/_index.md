---
# Title, summary, and page position.
linktitle: JR Configuration
weight: 120
#icon: book
icon_pack: fas

# Page metadata.
title: JR Configuration
date: '2023-06-01T00:00:00Z'
type: book # Do not modify.
---

JR can be configured via a json file called jrconfig.json. This file could be everywhere in the `$PATH`, in current dir (`.`) or in the `$JR_HOME` directory.
`$JR_HOME` defaults to `$HOME/.jr` but can easily be changed setting an environment variable:

```bash
JR_HOME=~/jrconfig/ jr template list
````
jrconfig has a global section and an emitter section

```json
{
  "global": {
    "seed": -1,
    "templateDir": "$HOME/.jr/templates",
    "kafkaConfig": "./kafka/config.properties",
    "schemaRegistry": true,
    "registryConfig": "./kafka/registry.properties",
    "serializer": "json-schema",
    "autoCreate": true,
    "redisTtl": "1m",
    "redisConfig": "./redis/config.json",
    "mongoConfig": "./mongoDB/config.json",
    "elasticConfig": "./elastic/config.json",
    "s3Config": "./s3/config.json",
    "url": ""
  }
}
```

The `global` section contains basic general configuration for JR, which can be overridden by corresponding flags with the `jr template run` command
