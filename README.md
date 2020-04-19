# Notes.app CLI

A command line interface for Notes.app on macOS.

This project is in a pre-alpha, proof-of-concept state. Use at your own risk.

## Usage

### Help

```text
Notes.app CLI

A command line interface for Notes.app on macOS.

Usage:
  notes-app add --body <body> --name <name> [--account <account>]
            [--folder <folder>]
  notes-app commands
  notes-app count [<folder>]
  notes-app delete <id> [--account <account>] [--folder <folder>]
  notes-app folders
  notes-app folders show <id> [--account <account>] [--properties <prop1>,<prop2>]
  notes-app list [--folder <folder>]
  notes-app show <id> [--account <account>] [--folder <folder>]
             [--properties <prop1>,<prop2>]
  notes-app update <id> (--body <body> | --name <name>) [--account <account>]
               [--folder <folder>]
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
  notes-app add --body <body> --name <name> [--account <account>]
            [--folder <folder>]

Options:
  --account    <account>        The account containing the new note.
  --folder     <folder>         The folder containing the new note.

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
  Print the number of notes in <folder>.
```

#### `delete`

```text
Usage:
  notes-app delete <id> [--account <account>] [--folder <folder>]

Options:
  --account    <account>        The account containing the note.
  --folder     <folder>         The folder containing the note.

Description:
  Delete note <id>.
```

#### `folders`

```text
Usage:
  notes-app folders
  notes-app show <id> [--account <account>] [--properties <prop1>,<prop2>]

Options:
  --account <name>  The accout containing the folder.

Description:
  List folders in an account.
```

#### `list`

```text
Usage:
  notes-app list [--folder <folder>]

Description:
  List notes.
```

#### `show`

```text
Usage:
  notes-app show <id> [--account <account>] [--folder <folder>]
             [--properties <prop1>,<prop2>]

Options:
  --account    <account>        The account containing the note.
  --folder     <folder>         The folder containing the note.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Available Properties:
  all
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
  notes-app update <id> (--body <body> | --name <name>) [--account <account>]
               [--folder <folder>]

Options:
  --account <account>  The account containing the note.
  --body    <body>     The new value for the note body.
  --folder  <folder>   The folder containing the note.
  --name    <name>     The new value for the note name.

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
