#!/usr/bin/bash

# foreward a kubeflow port
function kubeforward () {
  # this :- business is for default values
  SERVICE=${1:-ambassador}
  NAMESPACE_OPTION="--namespace ${2:-kubeflow}"
  PORT=${3:-8080}

  # kubectl port-forward svc/ambassador -n ${NAMESPACE} 8080:80
  kubectl port-forward $NAMESPACE_OPTION $(kubectl get pods $NAMESPACE_OPTION --selector=service=${SERVICE} --output name | head -n 1) ${PORT}:80
}

# set the title of a terminal tab
function title () {
    TITLE=$*;
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

# like which for a python package name
function whichpy () {
    PACKAGE=$1
    python -c "import ${PACKAGE}; print(${PACKAGE}.__file__)"
}

# git commit **-am push**
function amp () {
    git commit -am $1 && git push;
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

function kclone() { 
    git clone git@github.com:kevinbache/${1}.git 
}
