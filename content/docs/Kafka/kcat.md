---
title: Kcat
linktitle: KCat
type: book
date: '2023-04-17T00:00:00Z'
# Prev/next pager order (if `docs_section_pager` enabled in `params.toml`)
weight: 3
---

### Using JR to pipe data to **KCAT**

If you don't want to use the JR embedded Kafka support, you can use the wonderful [kcat](https://github.com/edenhill/kcat) 
CLI tool together with JR.

JR supports **kcat** out of the box. Using the `--kcat` flag the standard output will be formatted with K,V on a single line:
`--kcat` in fact it's only a shorthand equivalent for `--output stdout --outputTemplate '{{.K}},{{.V}}' --oneline`

```bash
jr run -k '{{randoms "ONE|TWO|THREE"}}' -f 1s -d 5s net_device --kcat | kcat -F kafka/config.properties -K , -P -t test
```
