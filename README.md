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
## Trouble fix
1. Could not parse linter output due to: Expected value but found invalid token at character 1  output: Error
   npm install eslint_d@13.1.2
