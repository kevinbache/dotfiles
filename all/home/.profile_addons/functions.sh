#!/usr/bin/bash

function kubeforward () {
  # this :- business is for default values
  SERVICE=${1:-ambassador}
  NAMESPACE_OPTION="--namespace ${2:-kubeflow}"
  PORT=${3:-8080}

  # kubectl port-forward svc/ambassador -n ${NAMESPACE} 8080:80
  kubectl port-forward $NAMESPACE_OPTION $(kubectl get pods $NAMESPACE_OPTION --selector=service=${SERVICE} --output name | head -n 1) ${PORT}:80
}

function title ()
{
    TITLE=$*;
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

function whichpy () 
{
    # like which for a python package name
    PACKAGE=$1	
    python -c "import ${PACKAGE}; print(${PACKAGE}.__file__)"
}

function amp () 
{
    git commit -am $1 && git push;
}
