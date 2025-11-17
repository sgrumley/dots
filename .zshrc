# ~/.zshrc

export ZSH="$HOME/.oh-my-zsh"

plugins=(
    vi-mode
    git
    docker
    fzf
    golang
    ripgrep
    tmux
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

# editor 
export EDITOR=nvim
alias v='nvim'
alias vim='nvim'
export PATH=$PATH:/usr/local/bin/nvim/nvim-linux64/bin # access to mason tools

# vars 
export COLORTERM=truecolor
export PATH=$PATH:~
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/sgrumley/.local/bin:$PATH

# lang
export PATH=$PATH:/home/sgrumley/.local/bin/zig-linux-x86_64-0.13.0
export PATH=$PATH:/home/sgrumley/.local/bin/odin-linux-amd64-nightly+2024-12-05

# go env
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
ZSH_THEME=""

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/conf.omp.json)"
eval "$(zoxide init zsh)"

# alias
alias cd='z'
alias cdi='zi'
alias his='cat ~/.zsh_history | awk -F";" '\''{print $2}'\'' | sort -u | fzf'
alias ls='lsd'

# git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias ga='git add'

# dev env
export GOPRIVATE="github.com/dtd-io/bifrost"
alias bif='~/repo/bifrost/cli/bif'
export GOTEX_CONFIG_FILE_PATH="~/.config/gotex/config.yaml"

if [ "$TMUX" = "" ]; then tmux; fi

# old conf 
# alias ls='exa -1 -a --icons --group-directories-first -F -l --git --no-permissions --no-user --no-time -h'
# eval "$(zellij setup --generate-auto-start zsh)"
# eval "$(starship init zsh)"
# yazi wrapper for exiting in dir
# function ya() {
#     tmp="$(mktemp -t "yazi-cwd.XXXXX")"
#     yazi --cwd-file="$tmp"
#     if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#         cd -- "$cwd"
#     fi
#     rm -f -- "$tmp"
# }
