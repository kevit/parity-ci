#!/bin/bash
repo_user=kevit
repo_name=parity-ci

if [ -z "$1" ] ; then
   echo "Use publish GITHUB_TOKEN"
else
export GITHUB_TOKEN=$1
github-release release -u $repo_user -r $repo_name --tag master --pre-release
github-release upload -u $repo_user -r $repo_name --name parity --tag master --file artefact/parity

fi
