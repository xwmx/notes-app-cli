# `notes-app` - Notes.app CLI

A command line interface for Notes.app on macOS.

`notes-app` uses AppleScript to interact with Notes.app to create,
list, update, and delete notes.

## Quirks

- Requires macOS
- Notes.app must be open. `notes-app` will open it in background if it's
    not already open.
- The formatting of the first line in a note is not preserved. Notes.app treats
    the first line of a note as the "name" of the note and does not allow
    formatting of this line through AppleScript, while the "body" of the note
    is formatted with HTML. When the note has a blank "name" line, the first
    line of the "body" is treated as the name, making any formatting on that
    line inaccessible to `notes-app`.

## Usage

### Help

```text
Notes.app CLI

A command line interface for Notes.app on macOS.

Usage:
  notes-app add --body <body> --name <name> [--account <account>]
                [--folder <folder>]
  notes-app commands
  notes-app count [--account <account>] [--folder <folder>]
  notes-app delete <id> [--account <account>] [--folder <folder>]
  notes-app folders
  notes-app folders show <id> [--account <account>] [--properties <prop1>,<prop2>]
  notes-app list [--account <account>] [--folder <folder>]
                 [--properties <prop1>,<prop2>]
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
  notes-app count [--account <account>] [--folder <folder>]

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
  notes-app folders show <id> [--account <account>] [--properties <prop1>,<prop2>]

Options:
  --account <name>  The accout containing the folder.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Available Properties:
  all
  id
  container
  name

Description:
  List folders in an account.
```

#### `list`

```text
Usage:
  notes-app list [--account <account>] [--folder <folder>]
                 [--properties <prop1>,<prop2>]

Options:
  --account <account>  The account containing the note.
  --folder  <folder>   The folder containing the note.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Available Properties:
  all
  counter
  id
  container
  passwordProtected
  creationDate
  modificationDate
  name
  body

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
  id
  container
  passwordProtected
  creationDate
  modificationDate
  name
  body

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
