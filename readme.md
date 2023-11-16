## Terminal
Must install a nerd font in windows to get icons in neovim

TODO: add code for getting catppuccin theme

## WSL Distro

https://github.com/yuk7/ArchWSL

1. [Download](https://github.com/yuk7/ArchWSL/releases/latest) the installer zip.
2. Extract all files in zip file to the same directory. Please extract to a folder that you have write permission. For example, `C:\Program Files` cannot be used since the rootfs cannot be modified there.
3. Run `Arch.exe` to extract the rootfs and register to WSL

As a side note, the executable name is what is used as the WSL instance name. If you rename it, you can have multiple installs.

On first open set the root password:
`passwd`

setup default user:
```shell
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

useradd -m -G wheel -s /bin/bash sgrumley

passwd sgrumley

exit

(in windows)
.\Arch.exe config --default-user sgrumley
```

Initialize Keyring
```shell
sudo pacman-key --init

sudo pacman-key --populate

sudo pacman -Sy archlinux-keyring

sudo pacman -Su
```

## Terminal Setup
### Basic Terminal Tools

```shell
sudo pacman -S wget openssh which unzip

sudo pacman -S --needed base-devel git
# install yay AUR pkg manager
git clone https://aur.archlinux.org/yay.git
```
#### Install zsh
[[Life/Learning/windows/dots/zshrc|zshrc]]
```shell
sudo pacman -S zsh

zsh /usr/share/zsh/functions/Newuser/zsh-newuser-install -f

# to list available shells
chsh -l

# find zsh and add in
chsh -s /usr/bin/zsh
```

### Install Oh My Zsh
This seems to wipe .zshrc so after installation copy from dot

``` shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# auto complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# syntax theme
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git

cd zsh-syntax-highlighting/themes/

mkdir ~/.zsh

cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/

# add "source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" above where the syntax highlighting is enabled
```

### Starship
[[starship.toml]]
```shell
sudo pacman -S starship

sudo pacman -S ttf-nerd-fonts-symbols

# add to ~/.zshrc
eval "$(starship init zsh)"

# theme https://github.com/catppuccin/starship
starship config
export STARSHIP_CONFIG=~/.config/starship.toml
```

### Extra Terminal Tools

```shell
sudo pacman -S neofetch

sudo pacman -S fzf 

sudo pacman -S ripgrep

sudo pacman -S zoxide

sudo pacman -S bat

sudo pacman -S exa 

sudo pacman -S fd

sudo pacman -S lazygit 

go install github.com/jesseduffield/lazydocker@latest
```


### Dev Tools
``` shell
sudo pacman -S go

sudo pacman -S docker

sudo groupadd docker

sudo usermod -aG docker $USER

sudo pacman -S docker-compose

sudo pacman -S buf 

go install github.com/pressly/goose/v3/cmd/goose@latest

yay -S go-task

sudo pacman -S make

# things to check out 
# devenv https://github.com/cachix/devenv
# direnv https://direnv.net/
```


### Git SSH
```shell
ssh-keygen -t ed25519 -C "grumsamu@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

git config --global user.name "sgrumley"

git config --global user.email "grumsamu@gmail.com"

git config --global url.git@github.com:.insteadOf https://github.com/

```


