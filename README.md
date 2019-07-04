# CentOS 5.11 에서 실행되는 옛날 PostgreSQL 서버들

<p style='color:red'>이 서버들은 운영 환경에서 사용할 수 없습니다!</p>

## 이미지 만들고 쉘 접속해 보기
```bash
# cd /root && mkdir tempdir && cd tempdir
# git clone https://github.com/i0seph/docker-centos-5.11-i386.git .
# docker build -t ioseph/centos5-32:1.0 .
# cd /root && mkdir tempdir2 && cd /root/tempdir2
# git clone https://github.com/i0seph/docker-postgresql-legacy-centos5.11-32.git .
# docker build -t ioseph/centos5-pglegacy-32 .
# docker run -it --rm ioseph/centos5-pglegacy-32
 ```

## 버전별 컨테이너 만들고 서버 실행

### 5.0(POSTGRES95 1.0) & 5.1(POSTGRES95 1.0.09) 버전
```bash
# mkdir -p /docker/pgdata && chmod 777 /docker/pgdata
# docker run -it --rm --user postgres -v /docker/pgdata:/data \
    --entrypoint cp ioseph/centos5-pglegacy-32 -a /postgres/5.0/data /data/5.0
# docker run -it --rm --user postgres -e PATH=/postgres/5.0/bin:/usr/bin:/bin \
    -e PGDATA=/data -e LANG=ko_KR.UTF-8 -e LC_COLLATE=C -e USER=postgres \
    -v /docker/pgdata/5.0:/data --entrypoint initdb ioseph/centos5-pglegacy-32
# docker run -d --name postgresql-5.0 --user postgres \
    -e PATH=/postgres/5.0/bin:/usr/bin:/bin \
    -e PGDATA=/data \
    -e LANG=ko_KR.UTF-8 \
    -e LC_COLLATE=C \
    -e USER=postgres \
    -v /docker/pgdata/5.0:/data \
    --entrypoint postmaster \
    ioseph/centos5-pglegacy-32
```

### 6.x 버전
```bash
# docker run -it --rm --user postgres -e PATH=/postgres/6.0/bin:/usr/bin:/bin \
    -e PGDATA=/data/6.0 -e LANG=ko_KR.UTF-8 -e LC_COLLATE=C -e USER=postgres \
    -v /docker/pgdata:/data --entrypoint initdb ioseph/centos5-pglegacy-32 -l /postgres/6.0/lib
# docker run -d --name postgresql-6.0 --user postgres \
    -e PATH=/postgres/6.0/bin:/usr/bin:/bin \
    -e PGDATA=/data \
    -e LANG=ko_KR.UTF-8 \
    -e LC_COLLATE=C \
    -e USER=postgres \
    -v /docker/pgdata/6.0:/data \
    --entrypoint postmaster \
    ioseph/centos5-pglegacy-32
```

### 7.0.3 버전
```bash
# docker run -it --rm --user postgres -e PATH=/postgres/7.0.3/bin:/usr/bin:/bin \
    -e PGDATA=/data/7.0 -e LANG=ko_KR.UTF-8 -e LC_COLLATE=C -e USER=postgres \
    -v /docker/pgdata:/data --entrypoint initdb ioseph/centos5-pglegacy-32
# docker run -d --name postgresql-7.0.3 --user postgres \
    -e PATH=/postgres/7.0.3/bin:/usr/bin:/bin \
    -e PGDATA=/data \
    -e LANG=ko_KR.UTF-8 \
    -e LC_COLLATE=C \
    -e USER=postgres \
    -v /docker/pgdata/7.0:/data \
    --entrypoint postmaster \
    ioseph/centos5-pglegacy-32
```


## 접속해 보고, 컨테이너 종료
```bash
# docker exec -it postgresql-5.0 psql template1
# docker stop postgresql-5.0
```

## 뒷정리
```
# docker rm postgresql-x.x
# docker image rm ioseph/centos5-xxx
```
