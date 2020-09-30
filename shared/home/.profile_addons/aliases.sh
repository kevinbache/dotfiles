#!/usr/bin/env bash

# Enable aliases to be sudo’ed
alias sudo='sudo '

export ADDONS="~/.profile_addons"

alias newalias="vim ${ADDONS}/aliases.sh && source ${ADDONS}/aliases.sh"
alias newfunc="vim ${ADDONS}/functions.sh && source ${ADDONS}/functions.sh"
alias newgit="vim ~/.gitconfig"
alias newssh="vim ~/.ssh/config"
alias newvim="vim ~/.vimrc"

alias ein="vim ~/.inputrc && include ~/.inputrc"
alias eprof="vim ~/.bash_profile && source ~/.bash_profile"
alias eprmpt="vim ${ADDONS}/bash_prompt.sh && source ${ADDONS}/bash_prompt.sh"

alias cdce="cd ~/projects/chillpill_examples"
alias cdc="cd ~/projects/chillpill"
alias cds="cd ~/projects/spin"
alias cdp="cd ~/projects"
alias cdk="cd ~/projects/kubeflow"
alias cdpi="cd ~/projects/kubeflow/pipelines"
alias cdkp="cdpi"
alias cdot="cd ~/projects/dotfiles"
#alias cdd="cdot"
alias cdf="cd ~/projects/kubeflow/fairing"
alias cdr="cd ~/projects/ritalin"
alias cdg="cd ~/projects/granola"
alias cdh="cd ~"
alias cdt="cd ~/projects/tablestakes"
alias cdd="cd ~/projects/tablestakes/js/docviz/"
alias cdw="cd ~/projects/weblab/"
#alias runweb="web-ext run --source-dir ~/projects/weblab/build/ --verbose --pref startup.homepage_welcome_url=https://example.com"
alias runweb="web-ext run --source-dir ~/projects/weblab/build/ --pref startup.homepage_welcome_url=https://example.com"
alias cdwt="cd ~/projects/webpack_tryouts/"
alias cdrt="cd ~/projects/raytest/"
alias cdpl="cd ~/projects/pytorch-lightning"

alias cdwa="cd ~/projects/wandb/"

alias ..='cd ..'
alias ...='cd ../..'

alias gc="gcloud "

alias gp="git pull"
alias gd="git diff"
alias gs="git status"
alias gcam="git commit -am"
alias gam="gcam"
alias gct="git commit -am transfer && git push"
alias gamp="amp"

alias raypf="ray exec -p 8265 ~/projects/raytest/aws-simple.yaml 'while true; do sleep 10000; done'"

alias pie="pip install --editable ."

alias k="kubernetes"
alias kgp="kubectl get pods --all-namespaces"

alias cloud="gcloud container clusters get-credentials standard-cluster-1 --zone us-central1-a --project kb-experiment"

alias kubedelall_really="kubectl delete daemonsets,replicasets,services,deployments,pods,rc --shared"
alias kubeshowall="kubectl -n kubeflow get shared"

alias countlines="LC_CTYPE=C && LANG=C && git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then
    # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else
	# macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# alias la="ls -la | grep \"^d\" && ls -la | grep \"^-\" && ls -la | grep -E \"^d|^-\" -v | grep -v \"^total\""

# List shared files colorized in long format
alias l="ls -lF ${colorflag}"

# List shared files colorized in long format, including dot files
alias ll="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
