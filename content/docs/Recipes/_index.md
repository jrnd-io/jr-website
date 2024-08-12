---
# Title, summary, and page position.
linktitle: JR Recipes
weight: 600
#icon: book
icon_pack: fas

# Page metadata.
title: JR Recipes
date: '2024-02-02T00:00:00Z'
type: book # Do not modify.
---

In this section you can find different recipes to solve issues with _jr_ 

## Using CSV

JR can be used to generate random data and export them to a csv file. This can be easily achieved using a custom template; next example will show how to generate custom data with a custom template and export results to file _city_temperature.csv_

```bash
echo -e "city;temperature" > city_temparature.csv && jr template run -n 4 --embedded '{{city}};{{format_float "%.1f" (floating 40 5)}}' >> city_temparature.csv
```

```bash
city;temperature
Tampa;30.2
Tucson;36.0
Cincinnati;31.5
Houston;24.2
```

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
jr template run --embedded '{{$bad:=regex "[A-Z]{5}"}}{{city | inject 0.5 $bad }}'
```

You can also run this `inject` example directly from the command line

```bash
jr man inject --run
```

## Getting the Key from the Value

If the key is part of your value, the easiest way is to do something like this

```json
{{$userid := (print "user_" (counter "user_id" 1 1 ) )}}{{set_v "KEY" $userid }}
{
    "registertime": {{integer64 1487715775521 1519273364600}},
    "userid": "{{$userid}}",
    "regionid": "Region_{{integer 1 9}}",
    "gender": "{{randoms "MALE|FEMALE|OTHER"}}"
}
```

In other words, adding a simple field - or a complex one like in the above example - to the context and naming it `KEY` will be enough. 
Note that this will override a key generated with the `--keytemplate` option
