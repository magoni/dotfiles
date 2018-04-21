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
