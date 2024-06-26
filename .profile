# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -s -d ':' -)"
fi

export LANG="en_US.UTF-8"
export SHELL="/bin/zsh"
export EDITOR="nvim"

# For Jetbrains products
export _JAVA_AWT_WM_NONREPARENTING=1

# XDG Paths config
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# XDG Specific configs
# export MYVIMRC="$XDG_CONFIG_HOME/vim/init.vim"
# export VIMINIT="source $MYVIMRC"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/ipython"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export R_ENVIRON="$XDG_CONFIG_HOME/r/.Renviron"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

export XMONAD_CONFIG_HOME="$XDG_CONFIG_HOME/xmonad"
export XMONAD_DATA_HOME="$XDG_DATA_HOME/xmonad"
export XMONAD_CACHE_HOME="$XDG_CACHE_HOME/xmonad"

export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"

# ncurses
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# Javascript
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
if [ -d "$GEM_HOME/ruby" ]; then
    PATH="$PATH:$(du $GEM_HOME/ruby/*/bin | cut -f2 | paste -s -d ':' -)"
fi
export PATH="$PATH:$GEM_HOME/bin"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$PATH:$CARGO_HOME/bin"
[ -f "$CARGO_HOME/env" ] && . "$CARGO_HOME/env"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"
export GHCUP_USE_XDG_DIRS=true
[ -f "$XDG_DATA_HOME/ghcup/env" ] && . "$XDG_DATA_HOME/ghcup/env"

# Python
# On Linux python executables installed with pip should be in ~/.local/bin
if [ "$(uname)" = "Darwin" ] && [ -f $HOME/Library/Python ]; then
    _pypaths="$(du $HOME/Library/Python/*/bin | cut -f2 | paste -s -d ':' -)"
    export PATH="$PATH:$_pypaths"
    unset _pypaths
fi
export RYE_HOME="$XDG_DATA_HOME/rye"

if [ "$(uname)" = "Darwin" ]; then
    export PATH="$PATH:/opt/homebrew/bin"
fi

if [ "$(uname)" = "Darwin" ]; then
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

