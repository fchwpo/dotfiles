# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/vshubham/.oh-my-zsh"
# ZSH CONFIGURATIONS
export TERM="xterm-256color"              # getting proper colors
export HISTORY_IGNORE="(ls|exa|cd|pwd|exit|neofetch|sudo reboot|history|cd -|cd ..|npmr build-client|npmr build-server|npmr start-server)"
# Source Powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# alias vim="nvim"
export EDITOR="nvim"
export VISUAL="nvim"
export ZSH_THEME="robbyrussell"
export HIST_STAMPS="mm/dd/yyyy"
export DISABLE_MAGIC_FUNCTIONS=true
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export COMPLETION_WAITING_DOTS=true
export DISABLE_UNTRACKED_FILES_DIRTY=true
# Android Studio Access Issue Xmonad
export _JAVA_AWT_WM_NONREPARENTING=1
# PLUGINS
# TO LAZY LOAD NVM USING zsh-nvm
export NVM_NO_USE=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nodemon')
export PATH=$HOME/.nvm/versions/node/v14.15.3/bin:$PATH
plugins=( git history zsh-autosuggestions zsh-syntax-highlighting zsh-nvm )
source $ZSH/oh-my-zsh.sh
# Go Setup
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.config/rofi/bin:$PATH
export PATH=$PATH:/home/vshubham/bin
# Custom Configurations
# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# :[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Managing Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dt="dotfiles"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias xmonadconf="nvim ~/.xmonad/xmonad.hs"
# Aliases Custom
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vpnstart="cd /home/vshubham/.open-vpn-work && make start-vpn"
# Credentials SSH
alias sshc="cat ~/ssh-credentials.yml"
# Npm and Yarn aliases
alias npmr="npm run"
alias npmiS="npm i -S"
alias npmiD="npm i -D"
alias npmig="npm i -g"
# Nginx and Other Services Aliases
alias nginxR="sudo systemctl restart nginx"
alias nginxS="sudo systemctl status nginx"
alias nginxC="sudo vim /etc/nginx/sites-available/store.conf"
# Directoreis
alias cdwork="cd /home/vshubham/Documents/code/work/projects"
alias cdplay="cd /home/vshubham/Documents/code/play"
alias webstore="cd /home/vshubham/Documents/code/work/projects/webstore"
alias cms-services="cd /home/vshubham/Documents/code/work/projects/cms-services"
alias omni-services="cd /home/vshubham/Documents/code/work/projects/omni-services"
# GIT
alias gitchp="git checkout origin/production -b"
alias gitpushp="git push -u origin"
alias gitsp="git stash pop"
# Kubernetes Local
alias mk="minikube"
alias mkdocker="eval $(minikube docker-env)"
alias kctl="kubectl"
# Docker Local
alias dk="docker"
# Use ll instead of ls
alias ls="exa -l --color=auto"
# Tmux aliases
alias tconfig="nvim ~/.config/tmux/tmux.conf"
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# get top space consuming folders in cwd
alias psspace='du -s * | sort -n | tail'
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias cats='cat $1 | grep $2'
# pacman and yay
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# Curl
alias curlpost='curl -H "Content-Type: application/json" -d @-'
################# Custom Scripts and Key Bindings #################
# Kill All Process Running on port specified
killport(){
	lsof -i :$1 | awk '{print $2}' | tail -n 1 | xargs kill
}
# Detect empty enter, execute git status if in git dir
magic-enter () {
        if [[ -z $BUFFER ]]; then
          if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
            echo -ne '\n'
            git status -sb
          fi
          zle accept-line
        else
          zle accept-line
        fi
}
zle -N magic-enter
bindkey "^M" magic-enter
# Extract any files
function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       rar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}
# GENERATE RANDOM PASSWORD OF 'N' LENGTH
randompasswd(){
	strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo
}
### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Script Aliases
alias weather="sh ~/.scripts/showWeather.sh"

