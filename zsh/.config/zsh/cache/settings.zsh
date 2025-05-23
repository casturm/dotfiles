# This file is generated automatically, do not edit by hand!
# Edit the files in ~/.config/zsh instead!
#
# alias.zsh:
#
if [ `uname` = Darwin ]; then
	alias ls='/usr/local/bin/gls --color=auto'
else
	alias ls='/bin/ls --color=auto'
fi

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents/Google\ Drive"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/dev"
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gd="git diff"
alias gp="git push"
alias s="git status"
alias h="history"
alias j="jobs"
alias be="bundle exec"

# Vim shortcuts
alias vi=vim
alias :e="\$EDITOR"
alias :q="exit"

alias l="ls -A -F"
alias ll="ls -h -l "
alias la="ls -a"
# List only directories and symbolic links that point to directories
alias lsd='ls -ld *(-/DN)'
# List only file beginning with "."
alias lsa='ls -ld .*'
alias grep="grep --color=auto"
alias know="vim ${HOME}/.ssh/known_hosts"
alias mc="mc --nosubshell"
alias reload!=". ${HOME}/.zshrc"
alias takeover="tmux detach -a"
alias vu="vagrant up"
alias vh="vagrant halt"
alias vp="vagrant provision"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias vbu="vagrant box update"
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

# Tmux
# alias tmux="TERM=xterm-256color tmux"

# Vericity
alias flex_db_int='psql -h database.marsint.vericity.net -d flex_event_service_v2 -U flex --password'
alias flex_db_qa='psql -h database.marsqa.vericity.net -d flex_event_service_v2 -U flex --password'
alias nbx_db_int='psql -h database.marsint.vericity.net -d nbx -U nbx --password'
alias nbx_db_qa='psql -h database.marsqa.vericity.net -d nbx -U nbx --password'
#
# completions.zsh:
#
# Completion
[ -d /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ${ZDOTDIR:-${HOME}}/.config/zsh/cache              # cache path

# Ignore completion functions for commands you don’t have
zstyle ':completion:*:functions' ignored-patterns '_*'

# Zstyle show completion menu if 2 or more items to select
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Format autocompletion style
zstyle ':completion:*:descriptions' format "%{$fg[green]%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$fg[orange]%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$fg[red]%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$fg[red]%}%d%{$reset_color%}"
zstyle ':completion:*' format "--[ %B%F{074}%d%f%b ]--"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':auto-fu:highlight' input white
zstyle ':auto-fu:highlight' completion fg=black,bold
zstyle ':auto-fu:highlight' completion/one fg=black,bold
zstyle ':auto-fu:var' postdisplay $' -azfu-'
zstyle ':auto-fu:var' track-keymap-skip opp
#zstyle ':auto-fu:var' disable magic-space

# Zstyle kill menu
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Zstyle ssh known hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/hosts,etc/ssh_,${HOME}/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Zstyle autocompletion
zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=black,bold
zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
zstyle ':auto-fu:var' postdisplay $'\n-azfu-'
zstyle ':auto-fu:var' track-keymap-skip opp

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
#
# env.zsh:
#
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000
# Share history between tmux windows
setopt SHARE_HISTORY

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='38;5;202'

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;67m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;65m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;172m' # begin underline
export LESS=-r

[[ -z $TMUX ]] && export TERM="xterm-256color"

# Midnight commander wants this:
export COLORTERM=truecolor

export GOPATH=${HOME}/Projects/Go

if [[ -e /usr/libexec/java_home ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# default postgres database
export PGDATABASE=postgres

path=(${HOME}/bin $path)
path=(${HOME}/dev/uw/docker/web/sessionmanager-bundle/bin $path)
export PATH
#
# functions.zsh:
#
# Function to determine the need of a zcompile. If the .zwc file
# does not exist, or the base file is newer, we need to compile.
# man zshbuiltins: zcompile
zcompare() {
	if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
		zcompile ${1}
	fi
}

# The following code helps us by optimizing the existing framework.
# This includes zcompile, zcompdump, etc.
compileAllTheThings () {
	setopt EXTENDED_GLOB
	local zsh_glob='^(.git*|LICENSE|README.md|*.zwc)(.)'

	# zcompile the completion cache; siginificant speedup.
	for file in ${ZDOTDIR:-${HOME}}/.zcomp${~zsh_glob}; do
		zcompare ${file}
	done

	# zcompile .zshrc
	zcompare ${ZDOTDIR:-${HOME}}/.zshrc

	# # Zgen
	# zgen_mods=${ZDOTDIR:-${HOME}}/.zgen/
	# zcompare ${zgen_mods}init.zsh
	# zcompare ${zgen_mods}zgen.zsh
	# # '/zdharma/'
	# for dir ('/zsh-users/' '/robbyrussell/oh-my-zsh-master/plugins/shrink-path/'); do
	# 	if [ -d "${zgen_mods}${dir}" ]; then
	# 		for file in ${zgen_mods}${dir}**/*.zsh; do
	# 			zcompare ${file}
	# 		done
	# 	fi
	# done
}

# Update dotfiles
rd () {
	e_header "Updating dotfiles..."
	pushd -q "${ZDOTDIR:-${HOME}}/dotfiles/"
	git pull
	if (( $? )) then
		echo
		git status --short
		echo
		e_error "(ノ°Д°）ノ︵ ┻━┻)"
		popd -q
		return 1
	else
		./setup.sh
	fi
	popd -q
}

# Load all custom settings from one cached file
recreateCachedSettingsFile() {
	setopt EXTENDED_GLOB
	local cachedSettingsFile=${ZDOTDIR:-${HOME}}/.config/zsh/cache/settings.zsh
	local recreateCache=false
	local rcFiles
	if [[ ! -s ${cachedSettingsFile} ]]; then
		recreateCache=true
	else
		rcFiles=(${ZDOTDIR:-${HOME}}/.zgenom/sources/init.zsh)
		rcFiles+=(${ZDOTDIR:-${HOME}}/.config/zsh/*.zsh)
		rcFiles+=(${ZDOTDIR:-${HOME}}/.secrets.zsh)
		for rcFile in $rcFiles; do
			if [[ -s $rcFile && $rcFile -nt $cachedSettingsFile ]]; then
				recreateCache=true
			fi
		done
	fi
	if [[ "$recreateCache" = true ]]; then
		touch $cachedSettingsFile
		echo "# This file is generated automatically, do not edit by hand!" > $cachedSettingsFile
		echo "# Edit the files in ~/.config/zsh instead!" >> $cachedSettingsFile
		# Zgenom
		if [[ -s ${ZDOTDIR:-${HOME}}/.zgenom/sources/init.zsh ]]; then
			echo "#"              >> $cachedSettingsFile
			echo "# Zgenom:"      >> $cachedSettingsFile
			echo "#"              >> $cachedSettingsFile
			cat ${ZDOTDIR:-${HOME}}/.zgenom/sources/init.zsh >> $cachedSettingsFile
		fi
		# Rc files
		for rcFile in ${ZDOTDIR:-${HOME}}/.config/zsh/*.zsh; do
			echo "#"              >> $cachedSettingsFile
			echo "# ${rcFile:t}:" >> $cachedSettingsFile
			echo "#"              >> $cachedSettingsFile
			cat $rcFile           >> $cachedSettingsFile
		done
		# Secrets
		if [ -s ${ZDOTDIR:-${HOME}}/.secrets.zsh ]; then
			echo "#"              >> $cachedSettingsFile
			echo "# Secrets:"     >> $cachedSettingsFile
			echo "#"              >> $cachedSettingsFile
			cat ${ZDOTDIR:-${HOME}}/.secrets.zsh >> $cachedSettingsFile
		fi
		zcompile $cachedSettingsFile
	fi
}

# Gather external ip address
exip () {
	e_header "Current External IP: "
	curl -s -m 5 http://ipv4.myip.dk/api/info/IPv4Address | sed -e 's/"//g'
}

# Determine local IP address
ips () {
	ifconfig | grep "inet " | awk '{ print $2 }'
}

#
# keybindings.zsh:
#
bindkey '^w' backward-kill-word
bindkey '^h' backward-delete-char
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^k' kill-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "${terminfo[khome]}" beginning-of-line # Fn-Left, Home
bindkey "${terminfo[kend]}" end-of-line # Fn-Right, End
#
# style.zsh:
#
# PATTERNS
# rm -rf
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=214')

# Sudo
ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=white,bold,bg=214')

# autosuggestion highlight
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

# Aliases and functions
FAST_HIGHLIGHT_STYLES[alias]='fg=068'
FAST_HIGHLIGHT_STYLES[function]='fg=028'

# Commands and builtins
FAST_HIGHLIGHT_STYLES[command]="fg=166"
FAST_HIGHLIGHT_STYLES[hashed-command]="fg=blue"
FAST_HIGHLIGHT_STYLES[builtin]="fg=202"

# Paths
FAST_HIGHLIGHT_STYLES[path]='fg=244'

# Globbing
FAST_HIGHLIGHT_STYLES[globbing]='fg=130,bold'

# Options and arguments
FAST_HIGHLIGHT_STYLES[single-hyphen-option]='fg=124'
FAST_HIGHLIGHT_STYLES[double-hyphen-option]='fg=124'

FAST_HIGHLIGHT_STYLES[back-quoted-argument]="fg=065"
FAST_HIGHLIGHT_STYLES[single-quoted-argument]="fg=065"
FAST_HIGHLIGHT_STYLES[double-quoted-argument]="fg=065"
FAST_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=065"
FAST_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=065"


FAST_HIGHLIGHT_STYLES[default]='none'
FAST_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
FAST_HIGHLIGHT_STYLES[reserved-word]='fg=green'
FAST_HIGHLIGHT_STYLES[precommand]='none'
FAST_HIGHLIGHT_STYLES[commandseparator]='fg=214'
FAST_HIGHLIGHT_STYLES[history-expansion]='fg=blue'

FAST_HIGHLIGHT_STYLES[assign]='none'
