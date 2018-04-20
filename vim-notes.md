## Finding files
You can use Normal mode Vim commands to move around in the text.  For example,
move the cursor atop a file and press <Enter>; you will then be editing that
file.  To go back to the browser use ":edit ." again, or use ":Explore".
CTRL-O also works.

`o,v` - open in horizontal, vertical split when on file
`i` - cycle view modes including tree

normal mode - on file name `gf` to edit file

`:find file.js` - find file, tab completes
`:find file.js` - " but in new tab
`:find *le.js` - fuzzy search

## Git
`]c`, `[c` - go to previous/next change

## Buffers
`:ls`
`:hide edit otherfile`
`:b file` - jumps to open file.js
`:b <Tab>` - nice lil buffer list

## Splits
https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally

## Misc
`C-p` - simple autocomplete

## TODO
- [ ] change swap file directory

