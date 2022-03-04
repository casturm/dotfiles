# Set umask
umask g-w,o-rwx

# If command is a path, cd into it
setopt auto_cd

# Colourfull messages
e_header()  { echo -e "\n\033[1m$@\033[0m"; }
e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }

# Load zgenom only if a user types a zgenom command
zgenom () {
	if [[ ! -s ${ZDOTDIR:-${HOME}}/.zgenom/zgenom.zsh ]]; then
		git clone https://github.com/jandamm/zgenom.git ${ZDOTDIR:-${HOME}}/.zgenom
	fi
	source ${ZDOTDIR:-${HOME}}/.zgenom/zgenom.zsh
	zgenom "$@"
}

# Generate zgenom init script if needed
if ! zgenom saved; then
	e_header "Creating zgenom save"
  zgenom oh-my-zsh plugins/shrink-path
	zgenom load zsh-users/zsh-autosuggestions
	zgenom load zdharma-continuum/fast-syntax-highlighting
	zgenom load zsh-users/zsh-history-substring-search
  zgenom load zsh-users/zsh-completions
	zgenom save
fi

# Load dircolors
if [ -s ${ZDOTDIR:-${HOME}}/.dircolors ]; then
	if (( $+commands[gdircolors] )); then
		eval $(command gdircolors -b ${ZDOTDIR:-${HOME}}/.dircolors)
	elif (( $+commands[dircolors] )); then
		eval $(command dircolors -b ${ZDOTDIR:-${HOME}}/.dircolors)
	fi
fi

# Load settings
if [[ ! -s ${ZDOTDIR:-${HOME}}/.config/zsh/cache/settings.zsh ]]; then
	source ${ZDOTDIR:-${HOME}}/.config/zsh/functions.zsh
	recreateCachedSettingsFile
fi
source ${ZDOTDIR:-${HOME}}/.config/zsh/cache/settings.zsh

# theme settings
ZSH_THEME="juanghurtado"

# omz path
export ZSH="$HOME/.oh-my-zsh"

# source omz
source $ZSH/oh-my-zsh.sh

# Remove whitespace after the RPROMPT
ZLE_RPROMPT_INDENT=0

setopt no_beep
eval "$(rbenv init -)"
