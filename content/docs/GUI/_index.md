---
# Title, summary, and page position.
linktitle: GUI
weight: 550
#icon: book
icon_pack: fas

# Page metadata.
title: GUI
date: '2024-02-02T00:00:00Z'
type: book # Do not modify.
---

## Using JR GUI

JR can be used with a GUI to facilitate template testing/editing.

Just use the `jr server` command and connect to the `7482` port (which is JR in ASCII).

On the landing page, you'll find a link to the template editor:

![Landing_page](https://github.com/user-attachments/assets/07d96c9b-72cc-4626-96bb-49986c169644)

Click on "Go to editor" to access the development page:

![Editor](https://github.com/user-attachments/assets/5f61dbf6-04d3-4561-b387-1d9100a691c9)

Begin creating your template. The editor will automatically update the resulting output in the panel at the bottom:

![Live edit](https://github.com/user-attachments/assets/42a217fc-5fbd-48cb-a25a-deff022b2fdc)

As you edit, you might encounter error messages related to invalid templates or non-existent functions:

![Error_template](https://github.com/user-attachments/assets/e574eb27-32f6-4513-b8af-130111f03613)

Once the template is valid, the final, usable version will be displayed within a green rectangle:

![03_valid_template](https://github.com/user-attachments/assets/191232f0-896a-432e-a5d2-46de51884d23)

When working with JSON, you can enable JSON output validation, check `Pretty print json output`:

![05_json_pretty_print](https://github.com/user-attachments/assets/0ff0bc2f-34a6-4b17-a910-7500d317c548)

With pretty-printed JSON output, the editor will highlight errors in both template syntax and JSON validity:

![06_valide_template_invalid_json](https://github.com/user-attachments/assets/328cbc03-af85-4d81-afcd-9968977d744d)

Now, you can generate new output to ensure that the templates match the desired results.

![99_refresh](https://github.com/user-attachments/assets/bc233d2e-a21d-413e-8d28-ca5d7d14023f)

During the editing process, you can use the `Function finder` to quickly access relevant documentation:

![97_function_finder](https://github.com/user-attachments/assets/f4a72fdc-f54f-4874-83c6-29ec39835313)





