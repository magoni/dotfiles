# magoni
My dotfiles.

## Setup
```
git submodule update
./create-symlinks.sh
```
```
# get latest vim on macOS
brew install vim
vi --version | head
sudo mv /usr/bin/vi /usr/bin/vi-7.4
sudo ln -s /usr/local/bin/vim /usr/local/bin/vi
```
```
# project search utility (provides /usr/local/bin/ag)
brew install the-silver-searcher
```
[nvm wrapper for fish](https://github.com/brigand/fast-nvm-fish)
