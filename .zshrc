# ~/.zshrc

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME=""

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(
    git
    dotenv
    docker
    docker-compose
    fd
    fzf
    golang
    ripgrep
    rust
    tmux
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# eval "$(zellij setup --generate-auto-start zsh)"
#eval "$(starship init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/conf.omp.json)"
eval "$(zoxide init zsh)"

# alias
alias cd='z'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias ga='git add'
alias m='make'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias ls='exa -1 -a --icons --group-directories-first -F -l --git --no-permissions --no-user --no-time -h'

export PATH=/home/sgrumley/.local/bin:$PATH
export EDITOR=nvim

# go env
export PATH=$PATH:$(go env GOPATH)/bin

# dev env
export GOOSE_DRIVER=postgres
export GOOSE_DBSTRING="user=dbuser password=dbpass host=localhost dbname=dbname sslmode=disable"


if [ "$TMUX" = "" ]; then tmux; fi

# yazi wrapper for exiting in dir
function ya() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
