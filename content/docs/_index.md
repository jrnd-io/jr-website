---
title: Introduction to JR
type: book # Do not modify.
weight: 110
toc: true
---

## What is JR?

JR is an Open Source CLI program that helps you to create quality random data for your streaming applications.
Creating random data for Kafka shouldn't be complex and cumbersome: JR is here to help you!

## Installation

The easiest way to install the latest stable release of jr is to use [brew](https://formulae.brew.sh/formula/jr) on mac/linux:

```bash
brew install jr
```

or [snap](https://snapcraft.io/jrnd) on linux:

```bash
sudo snap install jrnd
sudo snap alias jrnd.jr jr
```

At the moment there are some JR features that need you to recompile JR, for example, if you add your own templates _AND_ you want your templates serialized with AVRO. 
Luckily, that's pretty easy, at least on Unix systems, see [building](https://jrnd.io/docs/building/)

## Basic usage

![JR-simple](https://user-images.githubusercontent.com/89472/229626362-70ddc95d-1090-4746-a20a-fbffba4193cd.gif)

JR is very straightforward to use. There are several ready to use templates for your data.
Just invoke them from the CLI and you're done.

### Listing existing templates
```bash
jr template list
````
Templates are in the directory `$JR_SYSTEM_DIR/templates`. JR_SYSTEM_DIR defaults to the [XDG](https://specifications.freedesktop.org/basedir-spec/latest/) standard for your Operating System and can be changed to a different dir, for example:

```bash
$JR_SYSTEM_DIR=~/jrconfig/ jr template list
````
Templates with parsing issues are showed in <font color='red'>red</font>, Templates with no parsing issues are showed in <font color='green'>green</font>

### Using provided templates

Use for example the `net_device` template to generate a random JSON network device

```bash
jr template run net_device
```

It's also possible to use a shorter version of the command

```bash
jr run net_device
```

### Using your own templates

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

## Which functions can I use in a template?

![JR-man](https://user-images.githubusercontent.com/89472/229628592-68619ec7-2b1d-4704-8c76-ba59bb82579d.gif)

JR has plenty of embedded functions that can be used to write yor own templates.
We have included the documentation for all the functions directly into JR.

You can list all the available functions with a simple command:

```bash
jr function list
```

or, with a shorter syntax

```bash
jr man
```

You can filter by category:
```bash
jr man -c net
```
Or you can filter by name and description:
```bash
jr man -f random
```
You can also execute directly the Example using `-r` flag:

```bash
jr man ip -r
```
which will basically execute this command for you:

```bash
 jr run --template '{{ip "10.2.0.0/16"}}'
 ```

If you're really lazy and don't want to run `jr man`, this [page](../docs/functions) contains all the functions divided per category.

To study more advanced usages, look at the templates in your `templates` directory

## Templates

Templates are everywhere in JR.

There are:

- a template for the key, which you don't usually change (`--key`) and defaults to `null`
- a template for the value, which you can
  - refer by name: `jr run user` refers to template in `.jr/templates/user.tpl"
  - embed in the command line directly `jr run --template '{{ip "10.2.0.0/16"}}`
- a template that formats the output. It defaults to print just the Value `{{.V}}\n`, but sometimes you want to do different things, for example when you use JR in pipe with other commands

if you run for example

```bash 
jr run --template '{{ip "10.2.0.0/16"}} --kcat
```
you'll observe that `--kcat` changes the output Template to `{{.K}},{{.V}}\n` in order to print the Key, a comma, and the Value. 
To be compliant with what kcat is expecting, everything must be on a single line.

So `--kcat` it's only a shorthand equivalent for `--output stdout --outputTemplate '{{.K}},{{.V}}' --oneline`
