#!/bin/bash
# 创建定时任务每天早上一点半执行
pwd=$PWD
bash="$(which bash)"
crontab<<EOF
0 13 * * * $bash $pwd/mysql_backup.sh
EOF