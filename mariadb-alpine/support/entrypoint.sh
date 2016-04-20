#!/bin/sh
mkdir -p /data/log/mysql
mkdir -p /data/db/mysql/
mkdir -p /data/conf
mkdir -p /var/run/mysqld

chown -R mysql: /data /var/run/mysqld

if [ ! -f /data/conf/my.cnf ]; then
    mv /etc/mysql/my.cnf  /data/conf/my.cnf
fi

ln -sf /data/conf/my.cnf /etc/mysql/my.cnf
chmod o-r /etc/mysql/my.cnf

if [ ! -f /data/db/mysql/ibdata1 ]; then

    mysql_install_db --user=mysql --datadir="/data/db/mysql"

    /usr/bin/mysqld_safe --defaults-file=/data/conf/my.cnf &
    sleep 10s

    echo "UPDATE mysql.user SET Password=PASSWORD('${DB_ROOT_PASS}') WHERE User='root'; DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1'); DELETE FROM mysql.user WHERE User=''; DROP DATABASE test; FLUSH PRIVILEGES;" | mysql -u root

    echo "GRANT ALL ON *.* TO ${DB_USER}@'127.0.0.1' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION; GRANT ALL ON *.* TO ${DB_USER}@'localhost' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION; GRANT ALL ON *.* TO ${DB_USER}@'::1' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql -u root --password="${DB_ROOT_PASS}"

    killall mysqld
    killall mysqld_safe
    sleep 10s
    killall -9 mysqld
    killall -9 mysqld_safe
fi

mysqld --user=mysql