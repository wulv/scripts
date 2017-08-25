#!/bin/bash
#删除一个星期之前的所有本地分支
for k in $(git branch | sed /\*/d); do 
  if [ -n "$(git log -1 --before='1 week ago' -s $k)" ]; then
    git branch -D $k
  fi
done