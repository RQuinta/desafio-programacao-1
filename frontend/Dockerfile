FROM kyma/docker-nginx

COPY nginx.conf /etc/nginx/sites-enabled/default

COPY app/ /var/www/example.com/current/static/

CMD 'nginx'
