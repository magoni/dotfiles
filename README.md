# magoni

My dotfiles.

## Setup

1.

```
git submodule update
./create-symlinks.sh
```

2. https://brew.sh/ + XCode command-line tools if prompted

3. `./macos.sh`

4. `./apps.sh`

5.

```
# get latest vim on macOS
brew install vim
vi --version | head
sudo mv /usr/bin/vi /usr/bin/vi-default
sudo ln -s /usr/local/bin/vim /usr/local/bin/vi
```

6. [nvm wrapper for fish](https://github.com/brigand/fast-nvm-fish)
