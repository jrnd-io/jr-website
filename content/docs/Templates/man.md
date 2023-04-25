---
title: JR man 
linktitle: JR man documentation
type: book
date: '2023-04-17T00:00:00Z'
# Prev/next pager order (if `docs_section_pager` enabled in `params.toml`)
weight: 2
---
## Using JR man to look at all the available functions

![JR-man](https://user-images.githubusercontent.com/89472/229628592-68619ec7-2b1d-4704-8c76-ba59bb82579d.gif)

JR has plenty of embedded functions that can be used to write yor own templates.
We have included the documentation for all the functions directly into JR.

You can list all the available functions with a simple command:
```bash
jr man -l
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
To study more advanced usages, look at the templates in your `templates` directory
