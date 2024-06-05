FROM redis:7-alpine
COPY ./storage/redis/config/redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 16379
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
