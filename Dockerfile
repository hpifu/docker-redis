FROM redis:5.0.6
COPY redis.conf /usr/local/etc/redis/redis.conf
USER root
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
