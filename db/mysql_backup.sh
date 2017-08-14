#!/bin/bash
#mysql 备份脚本
#保留最近10天备份
#备份目录
backupDir=/root/backup/mysql
#mysqlDump
mysqldump="$(which mysqldump)"
#ip
host=localhost
#用户名
username=root
password=123456


#今天日期
today=`date +%Y%m%d`
#十天前的日期
timeTenDayAgo=`date -d -10day +%Y%m%d`
#要备份的数据库数组
databases=(hzbinas shadowsocks)


# echo $databaseCount

for database in ${databases[@]}
  do
    echo 'start backup '$database
    $mysqldump -h$host -u$username -p$password $database | gzip > $backupDir/$database-$today.sql.gz
    echo 'success backup '$database'to'$backupDir/$database-$today.sql.gz
    if [ ! -f "$backupDir/$database-$timeTenDayAgo.sql.gz" ]; then
      echo 'no 10 days ago backup file'
    else
        rm -f $backupDir/$database-$timeTenDayAgo.sql.gz
        echo 'delete 10 days ago backup '$backupDir/$database-$timeTenDayAgo.sql.gz
    fi
  done

  # 执行：bash mysql_backup.sh
  # 定时：crontab –e
  # 013* * * * /mysql_backup.sh