# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias gcc='gcc -fdiagnostics-color=always'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias pacman='pacman --color=always'
    alias yay='yay --color=always'
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
alias e="$EDITOR"

# XDG aliases
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'


# ZSH config
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep
bindkey -e
zstyle :compinstall filename '/home/andrew/.zshrc'
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

cdf() {
	cd $(find ~ -type d &>/dev/null | fzf)
}

set_ps1() {
    # red color if current user us root, otherwise - green
    [ "$USER" = "root" ] && UCOLOR="%B%F{red}" || UCOLOR="%B%F{green}"
    [ "$USER" = "root" ] && END="#" || END="$"
    BLUE="%B%F{blue}"
    PURPLE="%B%F{magenta}"
    STOP="%f%b"
    export PS1="%T $UCOLOR%n$STOP@$PURPLE%m$STOP:$BLUE%~$STOP $END "
}

set_ps1
