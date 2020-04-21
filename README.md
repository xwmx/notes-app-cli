# `notes-app` • Notes.app CLI

A command line interface for Notes.app on macOS. Add and edit notes in a
text editor with command line support like Vim, Emacs, VS Code, Sublime
Text, etc. Create, list, view, update, and delete notes using simple
terminal commands.

## Quirks

- Requires macOS.
- Notes.app must be open. `notes-app` will open it in background if it's
    not already open.
- The formatting of the first line in a note is not preserved. Notes.app treats
    the first line of a note as the "name" of the note and does not allow
    formatting of this line through AppleScript, while the "body" of the note
    is formatted with HTML. When the note has a blank "name" line, the first
    line of the "body" is treated as the name, making any formatting on that
    line inaccessible to `notes-app`.
- If a new note is created without a "name" specified, Notes.app sets the
    first line to "New Note".

## Installation

### Homebrew

To install with [Homebrew](http://brew.sh/):

```bash
brew install xwmx/taps/notes-app
```

## Usage

### Help

```text
Notes.app CLI

A command line interface for Notes.app on macOS.

Usage:
  notes-app accounts [show <account>] [--properties <prop1>,<prop2>]
  notes-app add [<name>] [--account <account>] [--body <body>] [--folder <folder>]
  notes-app attachments <note> [--account <account>] [--folder <folder>]
                        [--properties <prop1>,<prop2>]
  notes-app commands
  notes-app count [--account <account>] [--folder <folder>]
  notes-app delete <note> [--account <account>] [--folder <folder>]
  notes-app edit <note> [--account <account>] [--folder <folder>]
  notes-app export <path> [--account <account>] [--folder <folder>]
                   [--note <note>]
  notes-app folders [show <folder>] [--account <account>] [--folder <folder>]
                    [--properties <prop1>,<prop2>]
  notes-app list [--account <account>] [--folder <folder>]
                 [--properties <prop1>,<prop2>]
  notes-app show <note> [--account <account>] [--folder <folder>] [--open]
                 [--properties <prop1>,<prop2>]
  notes-app update <note> (--body <body> | --name <name>) [--account <account>]
                   [--folder <folder>]
  notes-app -h | --help | help [<subcommand>] [-l | --long]
  notes-app --version | version

Help:
  notes-app help [<subcommand>]

More Information:
  https://github.com/xwmx/notes-app-cli
```

### Subcommands

#### `accounts`

```text
Usage:
  notes-app accounts [show <account>] [--properties <prop1>,<prop2>]

Options:
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Identifiers:
  <account> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Available Properties:
  all
  id
  name

Subcommands:
  (default)  List all accounts.
  show       Show properties of <account>.

Description:
  List accounts or show an account.
```

#### `add`

```text
Usage:
  notes-app add [<name>] [--account <account>] [--body <body>] [--folder <folder>]

Options:
  --account <account>  The account containing the new note.
  --body    <body>     Plain text or HTML body content.
  --folder  <folder>   The folder containing the new note.

Identifiers:
  <account> and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Description:
  Add a new note. When no arguments are specified, a new blank note file is
  opened in the terminal editor, as set in the `$EDITOR` environment
  variable.

  When <name> is specified, the editor is not opened and a new note is created
  containing the specified <name> as the first line of the note.

Note Format:
  The format of each note provided by Notes.app consists of:

    Line  1:     An unformatted string representing the "Name" property.
    Lines 2-end: An HTML formatted body.

  Within Notes.app the first line can be formatted, but this formatting is not
  preserved when the note is retrieved or set via AppleScript, so any
  formatting in this line will likely be lost or inconsistent with what's
  displayed in Notes.app.
```

#### `attachments`

```text
Usage:
  notes-app attachments <note> [--account <account>] [--folder <folder>]
                        [--properties <prop1>,<prop2>]

Options:
  --account    <account>        The account containing the note.
  --folder     <folder>         The folder containing the note.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Identifiers:
  <note>, <account>, and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Available Properties:
  all
  id
  name
  container
  contentIdentifier

Description:
  List attachments of <note> idenitied by <id>, <name>, or <number>.
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
  notes-app delete <note> [--account <account>] [--folder <folder>]

Options:
  --account <account>  The account containing the note.
  --folder  <folder>   The folder containing the note.

Identifiers:
  <note>, <account>, and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Description:
  Delete <note>.
```

#### `edit`

```text
Usage:
  notes-app edit <note> [--account <account>] [--folder <folder>]

Options:
  --account    <account>  The account containing the note.
  --folder     <folder>   The folder containing the note.


Identifiers:
  <note>, <account>, and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Description:
  Edit a note idenitied by <id>, <name>, or <number> in your terminal editor,
  as set in the `$EDITOR` environment variable.

Note Format:
  The format of each note provided by Notes.app consists of:

    Line  1:     An unformatted string representing the "Name" property.
    Lines 2-end: An HTML formatted body.

  Within Notes.app the first line can be formatted, but this formatting is not
  preserved when the note is retrieved or set via AppleScript, so any
  formatting in this line will likely be lost or inconsistent with what's
  displayed in Notes.app.
```

#### `export`

```text
Usage:
  notes-app export <path> [--account <account>] [--folder <folder>]
                   [--note <note>]

Options:
  --account    <account>  The account containing the note.
  --folder     <folder>   The folder containing the note.
  --note       <note>     A note to export.

Identifiers:
  <note>, <account>, and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Description:
  Export notes and save in directory at <path>. By default, all notes in the
  default account (iCloud) are exported. Use --account,
  --folder, and --note flags to reduce the scope.

Limitations:
  - Attachments are not supported.
  - Some formatting is lost.
```

#### `folders`

```text
Usage:
  notes-app folders [show <folder>] [--account <account>] [--folder <folder>]
                    [--properties <prop1>,<prop2>]

Options:
  --account    <account>        The account containing the folder.
  --folder     <folder>         The parent folder, if any.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Identifiers:
  <account> and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

Available Properties:
  all
  id
  container
  name

Subcommands:
  (default)  List folders in the current account or folder.
  show       Show properties of <folder>.

Description:
  List folders in an account.
```

#### `list`

```text
Usage:
  notes-app list [--account <account>] [--folder <folder>]
                 [--properties <prop1>,<prop2>]

Options:
  --account <account>           The account containing the note.
  --folder  <folder>            The folder containing the note.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Identifiers:
  <account> and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

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
  List notes
```

#### `show`

```text
Usage:
  notes-app show <note> [--account <account>] [--folder <folder>] [--open]
                 [--properties <prop1>,<prop2>]

Options:
  --account    <account>        The account containing the note.
  --folder     <folder>         The folder containing the note.
  --open                        Open the note in Notes.app.
  --properties <prop1>,<prop2>  A comma-separated list of property names to
                                include in the output. Set to 'all' to include
                                all properties.

Identifiers:
  <note>, <account>, and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

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
  Show a note idenitied by <id>, <name>, or <number>.
```

#### `update`

```text
Usage:
  notes-app update <note> (--body <body> | --name <name>) [--account <account>]
                   [--folder <folder>]

Options:
  --account <account>  The account containing the note.
  --body    <body>     The new value for the note body.
  --folder  <folder>   The folder containing the note.
  --name    <name>     The new value for the note name.

Identifiers:
  <note>, <account>, and <folder> can be identified with one of the following:
    id      The Notes.app core data id (starts with 'x-coredata://').
    name    The name property.
    number  The current sequence number.

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
