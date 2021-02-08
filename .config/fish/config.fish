# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-onedark.sh
end

# source /usr/local/opt/resty/share/resty/resty
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"
source (rbenv init - | psub)
