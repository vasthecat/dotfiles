# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"
fi

export SHELL="/bin/zsh"
export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="firefox"
export VIMINIT="source $MYVIMRC"

# XDG Paths config
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_RUNTIME_DIR=""

# XDG Specific configs
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
export VIMINIT="source $MYVIMRC"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/ipython"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
