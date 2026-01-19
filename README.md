# nvim
## Install Nerd Front
1. Install Meslo Nerd Font
```shell
brew tap homebrew/cask-fonts
```
2. Then also need to install
```shell
brew install font-meslo-lg-nerd-font
```
This repository is for nvim configuration
## Install neovim
Run:
```shell
brew update
brew install neovim
```
Run:
```shell
brew install ripgrep
```
## Install Node
Run:
```shell
brew install node
```
## Install ripgrep
Run:
```shell
apt install ripgrep
#for grep string
```
## Install other useful terminal tools
1. Install bat
Run:
```shell
brew install bat
```
Usage:
```shell
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
# download tokyonight theme
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
#build theme
bat cache --build
```
Configuration for bat theme
```zsh
# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night
```
2. Install fzf
Run:
```shell
brew install fzf
```
Configuration in ~/.zshrc
```bash
# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

```
Usage:
```shell
fzf --preview 'bat -n --color=always --line-range :500 {}'
```
3. Tmux
Run:
```shell
brew install tmux
#install plugin
install tpm first
prefix + I

```
4. btop
Run:
```shell
brew install btop
```
5. zoxide

zoxide is a smarter, faster, and more modern version of the cd command. It is written in Rust and is designed to replace the older z script you asked about earlier.
Think of it as "Autocorrect for your file system."
What does it do?
It remembers every directory you visit. Instead of typing the full path to a folder, you just type a part of its name, and zoxide jumps you there instantly
To install zoxide:
```shell
# macOS / Linux (Homebrew):
brew install zoxide

# Ubuntu/Debian:
sudo apt install zoxide

# Windows:
winget install zoxide
```
6. ripgrep
   
ripgrep (command name: rg) is a command-line search tool that finds text within files. It is essentially a modern, much faster version of the classic grep command.

It is popular among developers because it is built in Rust (making it incredibly fast) and it has smart defaults (it automatically ignores files listed in your .gitignore and hidden folders like .git)
To install ripgrep

```shell
# macOS:
brew install ripgrep
# Ubuntu/Debian:
sudo apt install ripgrep
# Windows:
winget install BurntSushi.ripgrep.MSVC
```
7. fd

fd is a simple, fast, and user-friendly alternative to the classic find command. Like ripgrep and zoxide, it is written in Rust and is designed to fix the usability issues of older Unix tools.
```shell
# macOS:
brew install fd
# Windows:
winget install fd
#Debian/ubuntu
sudo apt install fd-find
```
## Trouble fix
1. Could not parse linter output due to: Expected value but found invalid token at character 1  output: Error
   npm install eslint_d@13.1.2
