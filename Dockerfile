FROM postgres:latest

ENV POSTGRES_PASSWORD=pw
ENV PGDATA=/pgdata

RUN mkdir ${PGDATA}

COPY init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint-initonly.sh
RUN chmod +x "/usr/local/bin/docker-entrypoint-initonly.sh"
RUN /usr/local/bin/docker-entrypoint-initonly.sh postgres
