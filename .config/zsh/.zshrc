# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
#compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump
# End of lines added by compinstall

# Turn on clint prompt
autoload -Uz promptinit
promptinit
prompt suse

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias la='ls -lhFA'
alias ll='ls -lhF'
alias  l='ls -CF'
alias dotfiles="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME'"
alias  dotstat="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' status"
alias  dotdiff="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' diff"
alias   dotadd="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' add -f"
alias vim="nvim"

