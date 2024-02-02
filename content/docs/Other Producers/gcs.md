---
# Title, summary, and page position.
linktitle: Google GCS
weight: 160
#icon: book
icon_pack: fas

# Page metadata.
title: Google GCS
date: '2024-02-01T00:00:00Z'
type: book # Do not modify.
---

Use with `--output = gcs`


`--gcsConfig` parameter to add a GCS configuration (default `"./gcs/config.json"`)

Current implementation uses Google Application Default Credentials to authorize and authenticate the client.
More information about Application Default Credentials and how to enable is at:
https://developers.google.com/identity/protocols/application-default-credentials.

Google GCS Configuration in `config.json`

```json
{
  "bucket_name": "<gcs-bucket-name>"
}
```
