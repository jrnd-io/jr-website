---
# Title, summary, and page position.
linktitle: Hello JR
summary: First JR Tutorial
weight: 100
#icon: book
icon_pack: fas

# Page metadata.
title: Hello JR
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

JR is a CLI program that helps you to create quality random data for your applications.

![JR-simple](https://user-images.githubusercontent.com/89472/229626362-70ddc95d-1090-4746-a20a-fbffba4193cd.gif)

## Basic usage

JR is very straightforward to use. Here are some examples:

### Listing existing templates
```bash
jr template list
````
Templates are in the directory `$JR_HOME/templates`. JR_HOME defaults to `~/.jr` and can be changed to a different dir, for example:

```bash
JR_HOME=~/jrconfig/ jr template list
````
Templates with parsing issues are showed in <font color='red'>red</font>, Templates with no parsing issues are showed in <font color='green'>green</font>

### Create random data from one of the provided templates

Use for example the predefined `net_device` template to generate a random JSON network device

```bash
jr template run net_device
```

It's also possible to use a shorter version of the command

```bash
jr run net_device
```


### Other options for templates

If you want to use your own template, you have several options:

- put it in the templates directory
- embed it directly in the command using the `--embedded` flag

For a quick and dirty test, the best option is to embed directly a template in the command:

```bash
jr run --embedded "name:{{name}}"
```

### Create more random data

Using `-n` option you can create more data in each pass.
This example creates 3 net_device objects at once:

```bash
jr run net_device -n 3
```
### Continuous streaming data

Using `--frequency` option you can repeat the creation every `f` milliseconds

This example creates 2 net_device every second, for ever:

```bash
jr run net_device -n 2 -f 1s 
```

Using `--duration` option you can time bound the entire object creation.
This example creates 2 net_device every 100ms for 1 minute:

```bash
jr run net_device -n 2 -f 100ms -d 1m
```

Results are by default written on standard out (`--output "stdout"`) with this output template:

```
"{{.V}}\n"
```

which means that only the "Value" is in the output. You can change this behaviour embedding a different template with `--outputTemplate`

This example will show the key too, which is null if not specified
```bash
jr template run --outputTemplate '{{.K}} {{.V}}' net_device 
```

This example will generate a key and print it:
```bash
jr template run --key '{{key "ID" 100}}' --outputTemplate '{{.K}} {{.V}}' net_device
```

In this example ```--kcat``` is used, which is equivalent to ```--outputTemplate '{{.K}},{{.V}}'```

```bash
jr run net_device -n 2 -f 100ms -d 1m --kcat
```

If you want syntax colouring and your output is just json, you can pipe standard output to [jq](https://jqlang.github.io/jq/)

```bash
jr run net_device -n 2 -f 100ms -d 1m | jq
```
Beware that if you, for example, include the key in the output, it won't be possible to use jq if the output is not a valid json.
```bash
jr run net_device -n 2 -f 100ms -d 1m --kcat | jq

parse error: Expected value before ',' at line 1, column 5
```
