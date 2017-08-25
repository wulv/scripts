#!/bin/bash
# 创建定时任务每天早上一点半执行

bash="$(which bash)"
crontab<<EOF
0 13 * * * $bash $PWD/mysql_backup.sh
EOF