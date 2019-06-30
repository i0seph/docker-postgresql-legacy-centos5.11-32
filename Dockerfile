FROM ioseph/centos5-32:1.0
RUN mkdir /postgres && cd /usr/sbin && ln -s ../../sbin/busybox addgroup && addgroup postgres && adduser -h /home/postgres -s /bin/bash -G postgres -D postgres && echo ". /etc/bashrc" > /home/postgres/.profile && chown postgres.postgres /home/postgres/.profile
ADD  postgres-legacy-centos5.tar.gz /postgres
ENTRYPOINT ["su", "-", "postgres"]
