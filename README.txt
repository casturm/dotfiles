#############################
##
## README
##
#############################

## Credit
This setup was heavily influenced and mostly borrowed from
https://github.com/Tuurlijk/dotfiles

#############################
##
## Min Zsh
##
#############################

https://rednafi.github.io/digressions/linux/2019/10/29/minimal-zsh.html

# min .zshrc
# =====================
# MINIMALIST ZSHRC
# AUTHOR: REDNAFI
# =====================

# omz path
export ZSH="$HOME/.oh-my-zsh"

# theme settings
ZSH_THEME="juanghurtado"

# pluging settings
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# autosuggestion highlight
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

# source omz
source $ZSH/oh-my-zsh.sh

#History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''                                        # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

#disable auto correct
unsetopt correct_all


#############################
##
## tmuxinator
##
#############################

## Install
brew install tmuxinator
