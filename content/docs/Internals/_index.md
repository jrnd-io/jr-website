---
# Title, summary, and page position.
linktitle: JR Internals
weight: 700
#icon: book
icon_pack: fas

# Page metadata.
title: JR Internals
date: '2024-02-02T00:00:00Z'
type: book # Do not modify.
---

In this section you can find informations about _jr_ internals. This section won't explain all the decisions/internals of _jr_, but we'll try to explain everything we think is relevant to understand it.

## Architecture

## Plugins

## Ticker

```mermaid
@startuml
namespace t {
class UTicker << (S,Aquamarine) >> {
- frequency time.Duration
- immediateStart bool
- nextTick <font color=blue>func</font>() time.Duration
- ticker *time.Ticker
- counter uint64

        + C <font color=blue>chan</font> time.Time

        - run() 
        - calculateNextTick() 
        - tick() 

        + Stop() 
        + Reset(d time.Duration) 

    }
}
@enduml
```
