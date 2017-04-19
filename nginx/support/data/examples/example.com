server {
    listen      [::]:80;
    listen      80;
    server_name example.com;
    index       index.php index.html index.htm;
    charset     utf-8;
    root        /data/sites/phalconphp.com/www/public;
    include     h5bp/basic.conf;
    error_log   /data/logs/www.phalconphp.com.error.log warn;
    access_log  /data/logs/www.phalconphp.com.access.log main;

    location / {
        try_files $uri $uri/ /index.php?_url=$uri&$args;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    location ~ \.php$ {
        try_files                     $uri =404;
        fastcgi_pass                  niden_fastcgi:9000;
        fastcgi_index                 /index.php;
        include                       fastcgi.conf;
        fastcgi_split_path_info       ^(.+\.php)(/.+)$;
        fastcgi_param PATH_INFO       $fastcgi_path_info;
        fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}
