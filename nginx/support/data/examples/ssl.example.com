server {
    listen      [::]:80;
    listen      80;
    server_name example.com www.example.com;
    return      301 https://example.com$request_uri;
}

server {
    listen              [::]:443 ssl http2;
    listen              443 ssl http2;
    server_name         www.example.com;
    include             h5bp/directive-only/ssl.conf;
    ssl_certificate     /data/example.com/ssl/example.com.pem;
    ssl_certificate_key /data/example.com/ssl/example.com.key;
    return              301 https://example.com$request_uri;
}

server {
    listen              [::]:443 ssl http2;
    listen              443 ssl http2;
    server_name         example.com;
    index               index.php index.html index.htm;
    charset             utf-8;
    include             h5bp/basic.conf;
    root                /data/sites/example.com/www/public;
    include             h5bp/directive-only/ssl.conf;
    include             h5bp/basic.conf;
    ssl_certificate     /data/example.com/ssl/example.com.pem;
    ssl_certificate_key /data/example.com/ssl/example.com.key;
    error_log           /data/logs/www.example.com.error.log warn;
    access_log          /data/logs/www.example.com.access.log main;

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
