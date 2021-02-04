# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
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
alias dotfiles="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME'"
alias  dotstat="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' status"
alias  dotdiff="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' diff"
alias   dotadd="/usr/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' add -f"
alias vim="nvim"

# Functions
fzf_cd() {
    cd "$(find ~ -type d | fzf)"
}

set_ps1() {
    # red color if current user us root, otherwise - green
    [ "$USER" = "root" ] && UCOLOR="\e[1;31m" || UCOLOR="\e[1;32m"
    [ "$USER" = "root" ] && END="#" || END="$"
    BLUE="\e[1;34m"
    PURPLE="\e[1;35m"
    STOP="\e[m"
    export PS1="\A $UCOLOR\u$STOP@$PURPLE\h$STOP:$BLUE\w$STOP $END "
}

bind '"\C-f":"fzf_cd\n"'

set_ps1
export TERM="xterm-256color"
