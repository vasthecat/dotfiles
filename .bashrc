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

# Functions
fzf_cd() {
    cd "$(find ~ -type d | fzf)"
}

bind '"\C-f":"fzf_cd\n"'

export PS1="\A \u@\h:\w >\[$(tput sgr0)\] "
