---
# Title, summary, and page position.
linktitle: Injecting Faults
summary: How to inject faults in data
weight: 210
#icon: book
icon_pack: fas

# Page metadata.
title: Injecting Faults
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

## Injecting Faults

The function `inject` may be used to inject faults in data with a given probability.
The function gets three parameters: a probability, the injected value and the original one.
Piping a good value to inject you can inject a fault/different value in the output, and you can mix and match any type.

Some examples:
```bash
# injecting a float instead of an integer
jr template run --embedded '{{integer 1 10 | inject 0.5 -0.001 }}'

# injecting a float instead of a string
jr template run --embedded '{{uuid | inject 0.5 -0.0001 }}'

# injecting a bad string
jr template run --embedded '{{$bad_city:=regex "[A-Z]{5}"}}{{city | inject 0.5 $bad_city }}'
```

You can also run an example directly from the command line `man`

```bash
jr man inject --run
```
