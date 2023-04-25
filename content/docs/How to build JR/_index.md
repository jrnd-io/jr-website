---
# Title, summary, and page position.
linktitle: How to build JR
summary: Learn how to build JR from the source
weight: 1
icon: book
icon_pack: fas

# Page metadata.
title: How to build JR
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

## Building and compiling

JR requires Go 1.20

you can use the `make_install.sh` to install JR. This script does everything needed in one simple command.

```bash
./make_install.sh
```

These are the steps in the `make_install.sh` script if you want to use them separately:

```bash
# generates the code and compile everything
make all
# copy the templates and data directory in the .jr in your $HOME folder
make copy_templates  
# copy the jr bin in /usr/local/bin
sudo make install
```

If you want to run the Unit tests, you have a `make` target for that too:

```bash
make test
```
