## netrw
You can use Normal mode Vim commands to move around in the text.  For example,
move the cursor atop a file and press <Enter>; you will then be editing that
file.  To go back to the browser use ":edit ." again, or use ":Explore".
CTRL-O also works.

`o,v` - open in horizontal, vertical split when on file
`i` - cycle view modes including tree

normal mode - on file name `gf` to edit file

## Git
`]c`, `[c` - go to previous/next change

## Buffers
`:ls`
`:hide edit otherfile`
`:b file` - jumps to open file.js
`:b <Tab>` - nice lil buffer list

## Splits
https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
`C-w o` - close every window but the current

## Editing
`C-p, C-n` - simple autocomplete
`;` - repeat last search (e.g. with `t` or `f`), `,` reverse
`s//c` - confirm each replacement
`C-a, C-x` - add/subtract, jump to digit

## Text objects
`i[w|t|"|p]` - inner word, tag, ", paragraph
`as` - a sentence
`C-p` - simple autocomplete
`:-16,-14co.` - line -16,-14 copy to here

## Macros
`qx{changes}q`, `@x` - record, repeat macro to register x

## general
use numbers to repeat more
`command [number] motion`

`C-g` - get file path
`?` - search backwards
`N` - previous match
`C-o C-i` - In and Out (jumplist)
`%` - matching paren
`:%s/old/new/gc` - `c` prompts before each replacement
`:#,#s/old/new/g` - between # and #
`![command]` - execute command
`:r[!] [FILENAME|COMMAND]` - insert file or command output

`"np` - put from `n` register
