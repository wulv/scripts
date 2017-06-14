#!/bin/bash

current_branch=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
printf "\nBranch: %s %s, Fetching...\n" `basename "$PWD"` $current_branch
git fetch


printf '\n\n========== Syncing dev ==========\n'
git checkout dev && git merge origin/dev  && git push


printf '\n\n========== Syncing master ==========\n'
git checkout master && git merge origin/master && git push


printf '\n\n========== Back to original branch ==========\n'
git checkout $current_branch

if [ "$1" == "build" ]; then
	./front $2
fi
