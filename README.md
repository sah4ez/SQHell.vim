# SQHell.vim

An SQL wrapper for Vim.
Currently you can:

- View tables
- View databases
- Describe tables
- Execute arbitrary commands
- View records from a table interactively

NOTE: Currently only MySQL is supported. Support for DBMS's should be trivial to add but are currently unimplemented.

## Examples

GIFS here

## Installation


### Vim Plug

```
Plug 'joereynolds/SQHell.vim'
```

## Configuration

Connection details will need to be supplied in order for SQHell.vim to connect
to your DBMS of choice.

Example:

```
let g:user = 'root'
let g:password = 'hunter2'
let g:host = 'mydatabaseconnection.office'
```

###  Safety

I **strongly** suggest that the above configuration details are kept *outside*
of version control and gitignored in your global gitignore.

## What about DBExt, vim-sql-workbench and others?

DBExt is very featurefuk (and very good) but comes in at a whopping 12000 lines
of code. By contrast SQHell.vim is a mere ~100 lines

The setup and installation process for vim-sql-workbench is something that I
aim to avoid with SQHell.vim, ideally a 'set and forget' plugin.

There are no clever inferences inside SQHell.vim, simplicity is the goal.
