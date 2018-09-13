FROM postgres:9.6

RUN apt-get update && apt-get install -y iputils-ping && apt-get purge

ENV PG_MAX_WAL_SENDERS="8" \
    PG_WAL_KEEP_SEGMENTS="8"

COPY setup-replication.sh /docker-entrypoint-initdb.d/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint-initdb.d/setup-replication.sh /docker-entrypoint.sh
