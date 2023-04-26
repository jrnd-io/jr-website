---
# Title, summary, and page position.
linktitle: Templates
summary: Work with templates
weight: 3
#icon: book
icon_pack: fas

# Page metadata.
title: Templates
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

Templates are everywhere in JR. 

There are:

- a template for the key, which you don't usually change (`--key`)
- a template for the value, which you can
  - refer by name: `jr run user` refers to template in `.jr/templates/user.tpl"
  - embed in the command line directly `jr run --template '{{ip "10.2.0.0/16"}}` 
- a template that formats the output. It defaults to print just the Value, but sometimes you want to do different things, for example when you use JR in pipe with other commands
