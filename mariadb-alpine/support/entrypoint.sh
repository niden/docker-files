#!/bin/sh
mkdir -p /data/log
mkdir -p /data/db
mkdir -p /data/conf
mkdir -p /var/run/mysqld

chown -R mysql: /data /var/run/mysqld

if [ ! -f /data/conf/my.cnf ]; then
    mv /etc/mysql/my.cnf  /data/conf/my.cnf
fi

ln -sf /data/conf/my.cnf /etc/mysql/my.cnf
chmod o-r /etc/mysql/my.cnf

if [ ! -f /data/db/ibdata1 ]; then

    mysql_install_db --user=mysql --datadir="/data/db"

    /usr/bin/mysqld_safe --defaults-file=/data/conf/my.cnf &
    sleep 10s

    echo "
    UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='root';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    DELETE FROM mysql.user WHERE User='';
    UPDATE mysql.user SET Host='%' WHERE User='root' AND Host='localhost';
    DROP   DATABASE test;
    FLUSH  PRIVILEGES;" | mysql -u root

    killall mysqld
    killall mysqld_safe
    sleep 10s
    killall -9 mysqld
    killall -9 mysqld_safe
fi

mysqld --user=mysql