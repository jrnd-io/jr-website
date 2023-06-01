---
# Title, summary, and page position.
linktitle: Emitters
emittersweight: 3
#icon: book
icon_pack: fas

# Page metadata.
title: Emitters
date: '2023-06-01T00:00:00Z'
type: book # Do not modify.
---

What's an emitter? It's basically a preconfigured jr job, and it's really helpful when you have to generate different entities with different generation parameters and relations between them.

You can configure emitters via API or via a json file. Let's see the predefined example:

```json
{
  "emitters": [
    {
      "name": "shoe",
      "locale": "us",
      "num": 0,
      "frequency": "0s",
      "duration": "0s",
      "preload": 10,
      "valueTemplate": "shoe",
      "output": "stdout",
      "keyTemplate": "null",
      "outputTemplate": "{{.V}}\n",
      "topic": "shoes"
    },
    {
      "name": "shoe_customer",
      "locale": "us",
      "num": 1,
      "frequency": "1s",
      "duration": "1s",
      "preload": 5,
      "valueTemplate": "shoe_customer",
      "output": "stdout",
      "keyTemplate": "null",
      "outputTemplate": "{{.V}}\n",
      "topic": "shoe_customers"
    },
    {
      "name": "shoe_order",
      "locale": "us",
      "num": 1,
      "frequency": "500ms",
      "duration": "1s",
      "preload": 0,
      "valueTemplate": "shoe_order",
      "output": "stdout",
      "keyTemplate": "null",
      "outputTemplate": "{{.V}}\n",
      "topic": "shoe_orders"
    },
    {
      "name": "shoe_clickstream",
      "locale": "us",
      "num": 1,
      "frequency": "100ms",
      "duration": "1s",
      "preload": 0,
      "valueTemplate": "shoe_clickstream",
      "output": "stdout",
      "keyTemplate": "null",
      "outputTemplate": "{{.V}}\n",
      "topic": "shoe_clickstream"
    }
  ],
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

As you can see, there are two main sections: `emitters` and `global`.

The `global` section contains basic general configuration for JR, while the `emitters` one is an array of emitters.
Each emitter has several parameters that can be configured:

- "name":  name of the emitter, will be shown for example with `jr emitter list`
- "locale": locale of this emitter, same as `--locale` in the cli interface
- "num":  number of objects to generate at each pass, same as `--num` in the cli interface
- "frequency": frequency of generation pass, same as `--frequency` in the cli
- "duration":  duration of the generation pass, same as `--duration` in the cli 
- "preload": size of the elements to generate in the preload phase, same as `--preload` in the cli
- "valueTemplate": template to be used, same as `args[0]` in the cli
- "output": output type, same as `--output` in the cli
- "keyTemplate": template for the key, same as `--key` in the cli.
- "outputTemplate": template for the output, same as `--outputTemplate` in the cli
- "topic": kafka topic, same as `--topic` in the cli

In this way, you can configure several emitters at once, with different parameters, and then run them all at once with a single command `jr emitter run`

## Example emitters

JR comes with some preconfigured emitters. You can look at the predefined emitters with:

```bash
jr emitter list
```

And look at how they are configured with:

```bash
jr emitter show [name]
```

To run all the configured emitters at once use:

```bash
jr emitter run
```

All the emitters will run in parallel. Emitters can coordinate using `context` functions in the templates:

```bash
jr man -c context
```

With the help of these functions it's possible to set values in a template and reuse it in another one, for example to create relationships.

Let's look at the show template:

```bash
jr template show shoe

{{$id:=uuid}}{{add_v_to_list "shoes_id_list" $id}}{
"id": "{{$id}}",
"sale_price": "{{amount 200 2000 ""}}",
"brand": "{{from "sport_brand"}}",
"name": "{{randoms "Pro|Cool|Soft|Air|Perf"}} {{from "cool_name"}} {{integer 1 20}}",
"rating": "{{format_float "%.2f" (floating 1 5)}}"
}
```

Here you can see that a random `uuid` is assigned to a `$id` variable, and then added to a `shoes_id_list` with the `add_v_to_list` command.
The list is automatically shared with all the running templates, so to have a working relationship you just need to get random ids from this list instead of generating them.

```bash
jr template show shoe_clickstream
{
"product_id": "{{random_v_from_list "shoes_id_list"}}",
"user_id": "{{random_v_from_list "customers_id_list"}}",
"view_time": {{integer 10 120}},
"page_url": "https://www.acme.com/product/{{random_string 4 5}}",
"ip": "{{ip "10.1.0.0/16"}}",
"ts": {{counter "ts" 1609459200000 10000 }}
}
```

In the shoe_clickstream template that's pretty clear: `product_id` and `user_id` are not random but come from `shoes_id_list` and `customers_id_list`, so there is full referential integrity.

If you need to have more than 1 value from a list, you can use the context function `random_n_v_from_list` instead of `random_v_from_list`. This function is guaranteed to peek n different values form the list, so is ideal for 1:many relationships.
