server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;
    error_log  /var/log/%web_system%/domains/%domain%.error.log error;

    location / {
        #proxy_pass http://unix:%home%/%user%/web/%domain%/nodeapp/app.sock:$request_uri;
        proxy_pass http://127.0.0.1:3000;
            proxy_redirect off;
        
        location ~* ^.+\.(%proxy_extensions%)$ {
            root           %docroot%;
            access_log     /var/log/%web_system%/domains/%domain%.log combined;
            access_log     /var/log/%web_system%/domains/%domain%.bytes bytes;
            expires        max;
            try_files      $uri @fallback;
        }
    }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    location @fallback {
        #proxy_pass http://unix:%home%/%user%/web/%domain%/nodeapp/app.sock:/$1;
        proxy_pass http://127.0.0.1:3000;
            proxy_redirect off;
    }

    location ~ /\.ht    {return 404;}
    location ~ /\.svn/  {return 404;}
    location ~ /\.git/  {return 404;}
    location ~ /\.hg/   {return 404;}
    location ~ /\.bzr/  {return 404;}

    include %home%/%user%/conf/web/nginx.%domain%.conf*;
}

