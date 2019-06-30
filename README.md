# CentOS 5.11 에서 실행되는 옛날 PostgreSQL 서버들

 ```bash
# cd /root && mkdir tempdir && cd tempdir
# git clone https://github.com/i0seph/docker-centos-5.11-i386.git .
# docker build -t ioseph/centos5-32:1.0 .
# cd /root && mkdir tempdir2 && cd /root/tempdir2
# git clone https://github.com/i0seph/docker-postgresql-legacy-centos5.11-32.git .
# docker build -t ioseph/centos5-pglegacy-32 .
# docker run -it --rm ioseph/centos5-pglegacy-32
 ```
