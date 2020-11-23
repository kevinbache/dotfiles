#!/usr/bin/env bash

# Enable aliases to be sudo’ed
alias sudo='sudo '

export ADDONS="~/.profile_addons"

alias wrapon="tput rmam"
alias wrapoff="tput smam"

# new / reload commands
alias newalias="vim ${ADDONS}/aliases.sh && source ${ADDONS}/aliases.sh"
alias newfunc="vim ${ADDONS}/functions.sh && source ${ADDONS}/functions.sh"
alias newgit="vim ~/.gitconfig"
alias newssh="vim ~/.ssh/config"
alias newvim="vim ~/.vimrc"

# edit / reload commands
alias ein="vim ~/.inputrc && include ~/.inputrc"
alias eprof="vim ~/.bash_profile && source ~/.bash_profile"
alias eprmpt="vim ${ADDONS}/bash_prompt.sh && source ${ADDONS}/bash_prompt.sh"

# cd commands
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
alias cdr="cd ~/projects/ray"
alias cdg="cd ~/projects/granola"
alias cdh="cd ~"
alias cdt="cd ~/projects/tablestakes"
alias cdd="cd ~/data/tablestakes/"
alias cdds="cd ~/data/tablestakes/datasets/"
alias cdtr="cd ~/projects/tablestakes/python/tablestakes/ml/ray_tune"
alias cdl="cd ~/projects/lawplus/lawplus/"

# RAY - LAWPLUS
export LAW_CLUSTER_DIR="${HOME}/projects/lawplus/lawplus/tune"
export LAW_CLUSTER_YAML_DIR="${LAW_CLUSTER_DIR}"
export LAW_CLUSTER_YAML="${LAW_CLUSTER_YAML_DIR}/cluster.yaml"

alias ldash="ray dashboard ${LAW_CLUSTER_YAML}"
alias lsub="ray submit ${LAW_CLUSTER_YAML} ${LAW_CLUSTER_DIR}/tune_runner.py --verbose"
alias latch="ray attach ${LAW_CLUSTER_YAML}"
alias lu="ray up ${LAW_CLUSTER_YAML} -y --verbose"
alias ld="ray down ${LAW_CLUSTER_YAML}"
alias lmon="ray exec ${LAW_CLUSTER_YAML} 'tail -n 100 -f /tmp/ray/session_latest/logs/monitor*'"

# RAY - TABLESTAKES
export RAY_CLUSTER_DIR="${HOME}/projects/tablestakes/python/tablestakes/ml2/tune"
export RAY_CLUSTER_YAML_DIR="${RAY_CLUSTER_DIR}/cluster_yamls"
export RAY_CLUSTER_YAML="${RAY_CLUSTER_YAML_DIR}/cluster.yaml"

alias car="conda activate ray"
alias sar="car"
alias pushts="ray rsync-up ${RAY_CLUSTER_YAML} ~/projects/tablestakes/python/ /home/ubuntu/projects/tablestakes/python -A"
alias pushtd="ray rsync-up ${RAY_CLUSTER_YAML} ~/data/tablestakes/datasets/  /home/ubuntu/data/tablestakes/datasets/ -A"

alias rdash="ray dashboard ${RAY_CLUSTER_YAML}"
alias rsub="ray submit ${RAY_CLUSTER_YAML} ${RAY_CLUSTER_DIR}/tune_runner.py --verbose"
alias ratch="ray attach ${RAY_CLUSTER_YAML}"
alias ru="ray up ${RAY_CLUSTER_YAML} -y --verbose"
alias rd="ray down ${RAY_CLUSTER_YAML}"
alias rmon="ray exec ${RAY_CLUSTER_YAML} 'tail -n 100 -f /tmp/ray/session_latest/logs/monitor*'"

export RAY_WORKBENCH_YAML1="${RAY_CLUSTER_YAML_DIR}/workbench1.yaml"
alias workup="ray up ${RAY_WORKBENCH_YAML1} -y --verbose"
alias workat="ray attach ${RAY_WORKBENCH_YAML1}"
alias workdown="ray down ${RAY_WORKBENCH_YAML1}"
alias wu="workup"
alias wa="workat"
alias wd="workdown"

export RAY_WORKBENCH_YAML2="${RAY_CLUSTER_YAML_DIR}/workbench2.yaml"
alias workup2="ray up ${RAY_WORKBENCH_YAML2} -y --verbose"
alias workat2="ray attach ${RAY_WORKBENCH_YAML2}"
alias workdown2="ray down ${RAY_WORKBENCH_YAML2}"
alias wu2="workup2"
alias wa2="workat2"
alias wd2="workdown2"

export RAY_WORKBENCH_YAML4="${RAY_CLUSTER_YAML_DIR}/workbench4.yaml"
alias workup4="ray up ${RAY_WORKBENCH_YAML4} -y --verbose"
alias workat4="ray attach ${RAY_WORKBENCH_YAML4}"
alias workdown4="ray down ${RAY_WORKBENCH_YAML4}"
alias wu4="workup4"
alias wa4="worka4"
alias wd4="workdown4"

alias findg="find * | grep"

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
alias countpy="find . -name '*.py' | xargs wc -l"

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
