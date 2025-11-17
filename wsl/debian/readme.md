```bash
sudo apt update
sudo apt upgrade
```
# Terminal
``` bash
# shell
sudo apt install zsh
zsh /usr/share/zsh/functions/Newuser/zsh-newuser-install -f
# list available shells
which zsh
chsh -s /usr/bin/zsh

# prompt
curl -s https://ohmyposh.dev/install.sh | bash -s
# then copy json conf to ~/.config/ohmyposh/conf.omp.json

```

# ZSH Plugins
```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# touch ~/.zsh_plugins.txt # or get the existing txt
# update .zshrc with 2 lines
# -> source ~/.antidote/antidote.zsh
# -> antidote load
```

```bash
# ~/.zsh_plugins.txt
zsh-users/zsh-autosuggestions
zdharma-continuum/fast-syntax-highlighting
JannoTjarks/catppuccin-zsh
```
# Tools
## APT
```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
cntrl-b + I # install plugins

# sudo apt install git curl unzip bat fzf ripgrep lsd wget fontconfig 
sudo apt install fontconfig
sudo apt install wget
sudo apt install unzip
sudo apt install git
sudo apt install curl
sudo apt install fzf
sudo apt install ripgrep
sudo apt install bat
sudo apt install lsd

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# install nerdfonts
# jetbrains mono
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

# viktor mono
```

## Neovim
Apt is not up to date and flatpak has env limtations. Build form source.
```bash
sudo apt install python3.11-venv
sudo apt install nodejs npm
sudo apt remove neovim
sudo apt install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

#ls
#cd build
#cpack -G DEB
# sudo dpkg -i nvim-linux64.deb
# sudo apt remove neovim
#sudo dpkg -i --force-overwrite  nvim-linux64.deb
```

# Lang
```bash
wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz

sudo apt install docker
sudo groupadd docker
sudo usermod -aG docker $USER

```

# Go Installs
```
go install github.com/jesseduffield/lazydocker@latest
go install github.com/jesseduffield/lazygit@latest
go install buf, goose...

```
# TODO: remove this and refer to actual file
# ZSHRC
```bash
# ~/.zshrc

source ~/.antidote/antidote.zsh
antidote load

export EDITOR=nvim
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~
export PATH=$PATH:/usr/local/bin/nvim/nvim-linux64/bin

# go env
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

ZSH_THEME=""

# init
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/conf.omp.json)"
eval "$(zoxide init zsh)"

# alias
alias cd='z'

#git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias ga='git add'

# neovim
alias v='nvim'
alias vim='nvim'
alias ls='lsd'

# keeping this conf for move to eza
#alias ls='exa -1 -a --icons --group-directories-first -F -l --git --no-permissions --no-user --no-filesize --no-time -h'

```

# Git SSH
```bash
ssh-keygen -t ed25519 -C "username"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

git config --global user.name "username"

git config --global user.email "email"

git config --global url.ssh://git@github.com/.insteadOf https://github.com/


```

