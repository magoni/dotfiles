# magoni
My dotfiles.

## Setup
```
git submodule update
./create-symlinks.sh
```
```
# get latest vim
brew install vim
vi --version | head
sudo mv /usr/bin/vi /usr/bin/vi-7.4
sudo ln -s /usr/local/bin/vim /usr/local/bin/vi
```

## TODO
* https://vimawesome.com/plugin/closetag-vim
* https://github.com/pangloss/vim-javascript or https://github.com/jelera/vim-javascript-syntax.git

### Maybe
* https://vimawesome.com/plugin/ale
* https://github.com/mileszs/ack.vim
* https://github.com/ggreer/the_silver_searcher
```
