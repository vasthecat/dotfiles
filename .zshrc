# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ] || [ "$(uname)" = "Darwin" ]; then
    alias ls='ls --color=auto'
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
alias dot="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME'"
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
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'

cdf() {
	cd "$(find ~ -type d &>/dev/null | fzf)"
}

set_prompt() {
    # red color if current user is root, otherwise - green
    [ "$USER" = "root" ] && UCOLOR="%B%F{red}" || UCOLOR="%B%F{green}"
    [ "$USER" = "root" ] && END="#" || END="$"
    BLUE="%B%F{blue}"
    PURPLE="%B%F{magenta}"
    STOP="%f%b"
    setopt PROMPT_SUBST
    PROMPT='%T $UCOLOR%n$STOP@$PURPLE%m$STOP:$BLUE%~$STOP${vcs_info_msg_0_}'$'\n''$END '
}
set_prompt
