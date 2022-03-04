dotfiles
========
My dotfiles was heavily influenced and mostly borrowed from https://github.com/Tuurlijk/dotfiles

## Requirements
Currently working with the following versions.
* `zsh` - 5.8
* `tmux`- 3.8
* `vim` - 8.2
* `ruby` - 2.7 - 3.1
* [Powerline capable font](https://github.com/powerline/fonts)

## Installation
```
git clone https://github.com/casturm/dotfiles "${ZDOTDIR:-$HOME}/dotfiles"
cd "${ZDOTDIR:-$HOME}/dotfiles"
./setup.sh

chsh -s /bin/zsh
```
