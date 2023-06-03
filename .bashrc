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

# XDG aliases
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'

# Bash config
bind "set completion-ignore-case on"

# Functions
cdf() {
    cd "$(find ~ -type d &>/dev/null | fzf)"
}

vcsinfo_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/^\(* \)//'
}

vcsinfo_branch() {
    branch=$(vcsinfo_git_branch)
    [ ! -z $branch ] && echo " ($branch)" && return
}

set_prompt() {
    # red color if current user us root, otherwise - green
    [ "$USER" = "root" ] && UCOLOR="\e[1;31m" || UCOLOR="\e[1;32m"
    [ "$USER" = "root" ] && END="#" || END="$"
    BLUE="\e[1;34m"
    PURPLE="\e[1;35m"
    STOP="\e[m"
    export PS1="\A $UCOLOR\u$STOP@$PURPLE\h$STOP:$BLUE\w$STOP\$(vcsinfo_branch)"$'\n'"$END "
}
set_prompt 0

source $HOME/.profile
