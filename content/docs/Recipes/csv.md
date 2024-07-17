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

_jr_ can be used to generate random data and export them to a csv file. This can be easily achieved using a custom template; next example will show how to generate custom data with a custom template and export results to file _city_temperature.csv_

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
