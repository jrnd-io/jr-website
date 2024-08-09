---
# Title, summary, and page position.
linktitle: Building from the source
summary: Learn how to build JR from the source
weight: 110
#icon: book
icon_pack: fas

# Page metadata.
title: Installation
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

## Installation on Unix systems (Linux/Mac)

The easiest way to install the latest stable release of jr is to use [brew](https://formulae.brew.sh/formula/jr) on mac/linux:

```bash
brew install jr
```

or [snap](https://snapcraft.io/jrnd) on linux:

```bash
sudo snap install jrnd
sudo snap alias jrnd.jr jr
```
If you need the latest bits, the repo with the code is [here](https://github.com/ugol/jr)

## Building and compiling

JR requires Go 1.22

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

## Installation on Windows


- Install MSYS2 https://www.msys2.org/
    ```shell
    winget install --id=MSYS2.MSYS2  -e
    ```


- Open the MSYS2 terminal and update the package database and core system packages:

    ```shell
    pacman -Syu
    ```

- After updating, close the terminal and open it again to continue the update process:

    ```shell
    pacman -Su
    ```

- Install Required Packages in MSYS2

    ```shell
    pacman -S base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake 
    mingw-w64-x86_64-pkg-config
    ```

- Clone the librdkafka repository:

    ```shell
    git clone https://github.com/edenhill/librdkafka.git
    cd librdkafka
    ```

- Create a build directory and navigate into it:

    ```shell
    mkdir build 
    cd build
    ```

- Build librdkafka, this will install DLLs under C:/Program Files (x86)/RdKafka/bin/

    ```shell
    ${MINGW_PREFIX}/bin/cmake -G "MSYS Makefiles" ..
    make install
    ```

- Clone the JR repository

    ```shell
    git clone https://github.com/ugol/jr
    cd jr
    ```

- Install and configure Go

    ```shell
    pacman -S mingw-w64-x86_64-go
    export GOROOT=${MINGW_PREFIX}/lib/go
    make all
    make copy_templates
    make copy_config
    make install
    ```
