# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

## Mermaid diagram
```mermaid
---
title: Diagram of a bot
---
flowchart LR
    W("WhatsApp") ---|SMS| T("Twilio") ---|HTTP| A["App"] --- G("OpenAI GPT")
    A --- D[(SQL)]
    A --- L[/log/]
```

## Dialogue

-- Mark: But what do you think?

-- William: I'm good

## Poetry

    This is a line of a poem
        And the continuation
    In sadness we walk

