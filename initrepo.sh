#!/bin/bash

# This initializes a new project as a git repo. In the directory of your existing project
# Usage Example: '/initrepo.sh "https://github.com/virufac/simple-bash-scripts.git"'

PWD=$(pwd)
GIT="$PWD/.git/"
echo "Executing $0 in $PWD"

if [ -d "$GIT" ]; then
  echo "$GIT already exists..."
  exit 1
fi

echo "Starting VCS directory at ./.git/"
echo "Touching README and adding to VCS"
echo "# simple-bash-scripts" >> README.md
git init

git config user.email $EMAIL
git config user.name $NAME
  

git add README.md
git commit -m "first commit"

echo "Trying to use clone url from second argument... Will fail without argument..."
git remote add origin $1
echo "Success. Pushing to master. Decline to enter password to cancel.''"
git push origin master
