#!/usr/bin/env zsh

# Logging stuff.
e_header()  { echo -e "\n\033[1m$@\033[0m"; }
e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
e_arrow()   { echo -e " \033[1;34m➜\033[0m  $@"; }

main () {
  local home=${ZDOTDIR:-${HOME}}

	# Get the directory in which the script resides
	local dotfileDir=${0:a:h}

	e_header "Creating symlinks..."
	mkdir -p $dotfileDir/backup

	setopt EXTENDED_GLOB
  local notGlob='^(README*|bin|setup.sh|backup|.config|.git*|.ruby-version|tags)(D)'
	for dir ('/' '/.config/'); do
		mkdir -p ${home}${dir}
		mkdir -p $dotfileDir/backup${dir}
    for rcfile in ${dotfileDir}${dir}${~notGlob}; do
	    local target="${home}${dir}${rcfile:t}"
			[[ -a "${target}" ]] && mv "${target}" "$dotfileDir/backup/${dir}" 2>/dev/null
  		if [ $(uname) = Darwin ]; then
			    command ln -h -s -F "$rcfile" "${target}"
            else
			    command ln -s "$rcfile" "${target}"
            fi
    done
  done

	e_header "Installing vim plugins..."
	vim -S <(echo -e "PlugInst \n q \n q")

	source $home/.config/zsh/functions.zsh
	e_header "Concatenating .config/zsh files into single file..."
	recreateCachedSettingsFile
	e_header "Compiling zsh files for increased speed..."
	compileAllTheThings

	echo
	e_success "All done!"
}

main "$1"
