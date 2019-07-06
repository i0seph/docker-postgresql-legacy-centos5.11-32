FROM ioseph/centos5-32:1.0
ARG PGVER=5.0
RUN mkdir /postgres
ENV PGDATA=/home/postgres/data PGUSER=postgres PGDATABASE=template1 PATH=/postgres/${PGVER}/bin:/usr/bin:/bin:/sbin:/usr/sbin LANG=ko_KR.UTF-8 LC_COLLATE=C
ADD postgresql-${PGVER}-centos5-i386.tar.gz /postgres/
RUN cd /usr/sbin && ln -s ../../sbin/busybox addgroup && addgroup postgres && adduser -h /home/postgres -s /bin/bash -G postgres -D postgres && echo ". /etc/bashrc" > /home/postgres/.profile && chown postgres.postgres /home/postgres/.profile && if [ -d /postgres/${PGVER}/data ]; then su postgres -c "cp -af /postgres/${PGVER}/data /home/postgres"; fi
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
