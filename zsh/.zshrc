# SOURCES
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dotfiles/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# EXPORTS
export QT_QPA_PLATFORM=wayland
export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/damir/.local/bin:$PATH
# export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

 #THEMES
ZSH_THEME="powerlevel10k/powerlevel10k"

# PLUGINS
plugins=(
  sudo
  dirhistory
  jsontools
  extract
  history
  copyfile
  mosh
  zsh-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# ALIASES
alias ezsh='exec zsh'
alias xo='xdg-open'
alias f='fdfind'
alias cdhdd='cd /mnt/sda1/'
# QUIT
alias :q='exit'
alias q='exit'
alias e='exit'

alias h='history'
alias g='grep --color=auto'
alias c='clear'
alias o='xdg-open .'
alias grep='grep --color=auto'

alias mchmod='chmod +x'
# FILE
alias ls='exa --color=always --icons=always'
alias ll='exa --icons -l | sort -k 9'
alias lsi='ls | grep'
alias lli='ll | grep'
alias lt='exa -aT --color=always --group-directories-first --icons'

alias sus='sudo systemctl'
alias suss='sudo systemctl status'
# VBOX_MANAGE
alias vb='VBoxManage'
alias vbl='vb list vms'
alias vbs='vb startvm'
alias vbc='vb controlvm'

# alias lazypodman='lazydocker'

# TOOLS
alias t='tldr'
alias f='fuck'
alias nv='nvim'
# RANGER
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rr='ranger'
alias y='yazi'

alias ug='uuidgen -r'

alias xc='ctop'
alias xlg='lazygit'
alias xld='lazydocker'

# SEARCH
alias ffile='find . -type f -name'
alias fany='find . -name'

alias cdssh='cd ~/.ssh; ll'
alias nalias='nvim ~/dotfiles/zsh/.zshrc'

alias plist='expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort -r | less'

function aliasi() {
    alias | grep "$1"
}

alias lport='lsof -i'

alias mcc='sudo sh -c "echo 3 >  /proc/sys/vm/drop_caches"'

alias doc='ls -l ~/Documents/documentation/'

function cdoc() {
   bat ~/Documents/documentation/"$1"
}

# GIT
alias gcl='git clone'
alias glg='git log'
alias gs='git status'
alias gcm='git commit -m'
alias gch='git checkout'
alias ga='git add'
alias gp='git push'
alias gb='git brahch'
alias gba='git brahch -a'
alias gr='git reset'
alias gpl='git pull'
alias gb='git branch'

# Docker
function gdeploy() {
    git add .; git commit -m "$1"; git push
}

alias dps=    'docker ps --format="+-------------------------------------------+\n| > ID\t{{.ID}}\n| NAME\t{{.Names}}\n|  IMAGE\t{{.Image}}\n|  PORTS\t{{.Ports}}\n|  COMMAND\t{{.Command}}\n|  CREATED\t{{.CreatedAt}}\n|  STATUS\t{{.Status}}\n|"'
alias dpsa='docker ps -a --format="+-------------------------------------------+\n| > ID\t{{.ID}}\n| NAME\t{{.Names}}\n|  IMAGE\t{{.Image}}\n|  PORTS\t{{.Ports}}\n|  COMMAND\t{{.Command}}\n|  CREATED\t{{.CreatedAt}}\n|  STATUS\t{{.Status}}\n|"'
alias di='docker images'
alias dim='docker images | sort'
alias dclean='docker system prune --all --force --volumes'
alias ddf='docker system df'

alias dasno='docker update --restart=no'

alias drmi='docker rmi'
alias drm='docker rm'

alias dlogs='docker logs'
alias dstop='docker stop'
alias dsallc='docker stop $(docker ps -q)'
alias drmallc='docker rm $(docker ps -aq)'

# Ansible
alias ap='ansible-playbook'

function openl ()
{
  xdg-open https://localhost:"${1}"
}

# удалить все образы по имени
function dremgi() {
    docker images | grep -E "$1" | awk '{print $3}' | xargs docker rmi -f
}

# удалить все контейнеры по имени
function dremgc() {
    docker ps -a | grep -E "$1" | awk '{print $1}' | xargs docker rm -f
}

alias cdthesis='cd ~/Documents/THESIS/PROJECT/'
alias check-port='nc -zv' # ❯ nc -zv 127.0.0.1 8888

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -s /home/damir/.autojump/etc/profile.d/autojump.sh ]] && source /home/damir/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# eval $(thefuck --alias)
# eval $(thefuck --alias --enable-experimental-instant-mode)


# bun completions
[ -s "/home/damir/.bun/_bun" ] && source "/home/damir/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(atuin init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fzf --zsh)"
