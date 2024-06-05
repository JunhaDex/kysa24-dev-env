FROM mysql:8-oracle
ENV MYSQL_ROOT_PASSWORD=000000
ENV MYSQL_DATABASE=service
ENV MYSQL_USER=user1
ENV MYSQL_PASSWORD=000000
ENV MYSQL_TCP_PORT=13306
COPY ./storage/mysql/config /etc/mysql/conf.d
#COPY ./storage/mysql/init /docker-entrypoint-initdb.d
EXPOSE 13306
