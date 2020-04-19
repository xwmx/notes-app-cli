# Notes.app CLI

A command line interface for Notes.app on macOS.

This project is in a pre-alpha, proof-of-concept state. Use at your own risk.

## Usage

### Help

```text
Notes.app CLI

A command line interface for Notes.app on macOS.

Usage:
  notes-app add --body <body> --name <name> [--folder <name>]
  notes-app commands
  notes-app count [<folder>]
  notes-app delete <id> [--folder <name>]
  notes-app folders
  notes-app list [<folder>]
  notes-app show <id> [--folder <name>] [--properties <prop1>,<prop2>]
  notes-app update <id> [--folder <name>] (--body <body> | --name <name>)
  notes-app -h | --help | help [<subcommand>] [-l | --long]
  notes-app --version | version

Help:
  notes-app help [<subcommand>]

More Information:
  https://github.com/xwmx/notes-app-cli
```

### Subcommands

#### `add`

```text
Usage:
  notes-app add --body <body> --name <name> [--folder <name>]

Description:
  Add a new note.
```

#### `commands`

```text
Usage:
  notes-app commands

Description:
  List available commands
```

#### `count`

```text
Usage:
  notes-app count [<folder>]

Description:
  Print the number of notes in <folder>
```

#### `delete`

```text
Usage:
  notes-app delete <id> [--folder <name>]

Description:
  Delete note <id>.
```

#### `folders`

```text
Usage:
  notes-app folders

Description:
  List folders in the current account.
```

#### `list`

```text
Usage:
  notes-app list [<folder>]

Description:
  List notes.
```

#### `show`

```text
Usage:
  notes-app show <id> [--folder <name>] [--properties <prop1>,<prop2>]

Options:
  --properties  A comma-separated list of property names for the note.
                Set to 'all' to include all properties.

Available Properties:
  noteId
  noteContainer
  notePasswordProtected
  noteCreationDate
  noteModificationDate
  noteName
  noteBody

Description:
  Show a note.
```

#### `update`

```text
Usage:
  notes-app update <id> [--folder <name>] (--body <body> | --name <name>)

Description:
  Update a note.
```

## Tests

To run the [test suite](test), install
[Bats](https://github.com/bats-core/bats-core) and run `bats test` in the project
root.

---
<p align="center">
  Copyright (c) 2020 William Melody • See LICENSE for details.
</p>

<p align="center">
  <a href="https://github.com/xwmx/notes-app-cli">github.com/xwmx/notes-app-cli</a>
</p>
