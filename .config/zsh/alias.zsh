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
alias tmux="TERM=xterm-256color tmux"
alias tx="tmuxinator"
alias mx="tmuxinator start mars"

# Vericity
alias flex_db_int='psql -h database.marsint.vericity.net -d flex_event_service_v2 -U flex --password'
alias flex_db_qa='psql -h database.marsqa.vericity.net -d flex_event_service_v2 -U flex --password'
alias nbx_db_int='psql -h database.marsint.vericity.net -d nbx -U nbx --password'
alias nbx_db_qa='psql -h database.marsqa.vericity.net -d nbx -U nbx --password'
