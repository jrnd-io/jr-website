---
# Title, summary, and page position.
linktitle: Export to CSV
weight: 120
#icon: book
icon_pack: fas

# Page metadata.
title: Export to CSV
date: '2024-02-01T00:00:00Z'
type: book # Do not modify.
---

_jr_ can be used in conjunction with _jq_ to export data in a csv.

Next example will show how to create a _data.csv_ from template _net_device_:


```bash
# generate 4 entries, output to temp file data.json and data2.csv, generate file data.csv

jr run net_device -n 4 > data.json && jq -r 'to_entries|(map(.value))|@csv' data.json > data.csv && jq -r 'to_entries|(map(.key))|@csv' data.json | head -1 >> data.csv &&  awk '{a[NR]=$0}END{for(x=1;x<NR;x++){if(x==1)print a[NR];print a[x]}}' data.csv > data2.csv && mv data2.csv data.csv && rm data.json
```

Content of file _data.csv_:

```bash
"VLAN","IPV4_SRC_ADDR","IPV4_DST_ADDR","IN_BYTES","FIRST_SWITCHED","LAST_SWITCHED","L4_SRC_PORT","L4_DST_PORT","TCP_FLAGS","PROTOCOL","SRC_TOS","SRC_AS","DST_AS","L7_PROTO","L7_PROTO_NAME","L7_PROTO_CATEGORY"
"GAMMA","10.1.205.164","10.1.2.134",1677,1706086252,1706596737,22,22,0,4,136,4,0,443,"FTP","Transport"
"ALPHA","10.1.119.252","10.1.7.206",1284,1702598972,1706512823,631,80,0,3,253,2,1,443,"UDP","Application"
"BETA","10.1.111.105","10.1.175.125",1720,1702076218,1706233124,631,443,0,2,155,4,1,443,"UDP","Session"
"ALPHA","10.1.216.100","10.1.201.1",1599,1703239149,1705943616,22,443,0,3,234,3,1,81,"TCP","Transport
```
