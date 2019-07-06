# CentOS 5.11 에서 실행되는 옛날 PostgreSQL 서버들

```diff
- 이 서버들은 운영 환경에서 사용할 수 없습니다!
```

## CentOS 5.11 32bit 이미지 만들기
```bash
cd ~ && mkdir tempdir && cd tempdir
git clone https://github.com/i0seph/docker-centos-5.11-i386.git .
docker build -t ioseph/centos5-32:1.0 .
```

## 빌드 환경 복사
```
cd ~ && mkdir tempdir2 && cd tempdir2
git clone https://github.com/i0seph/docker-postgresql-legacy-centos5.11-32.git .
```

## 버전별 컨테이너 만들기

### 5.0(POSTGRES95 1.0) & 5.1(POSTGRES95 1.0.09) 버전
```bash
docker build -t i386/centos5/postgres:5.x --build-arg PGVER=5.x .
docker run -it --name postgresql-5.x i386/centos5/postgres:5.x
```

### 6.x 버전
```bash
docker build -t i386/centos5/postgres:6.x.x --build-arg PGVER=6.x.x .
docker run -it --name postgresql-6.x -e PGLIB=/postgres/6.x.x/lib i386/centos5/postgres:6.x.x
```

### 7.0.3 버전
```bash
docker build -t i386/centos5/postgres:7.0.3 --build-arg PGVER=7.0.3 .
docker run -it --name postgresql-7.0 i386/centos5/postgres:7.0.3 -E unicode
```

## 각 서버 실행
```
docker start postgresql-x.x
```

## 각 서버 사용해 보기
```bash
docker exec -it postgresql-7.0.3 psql
```

### 5.x 버전 특수 상황
5.0, 5.1 버전은 PGUSER, PGDATABASE 같은 환경 변수를 사용하지 않기 때문에, 기본 psql 명령 만으로 접속하면 오류가 발생한다.
다음 두 명령으로 root 사용자와, root 데이터베이스를 만들면, 이 문제를 해결 할 수 있다.

```
docker exec -it postgresql-5.0 su postgres -c "psql -c 'create database root' template1"
docker exec -it postgresql-5.0 su postgres -c "createuser root"
```

사용자를 만드는 CREATE ROLE SQL 명령어가 없어서 쉘에서 사용자 대화형으로 만들어야한다. "Enter user's postgres ID ->" 이렇게 물어보면, 501 이상으로 지정하면 된다.

## 각 서버 중지
```
docker exec -it postgresql-7.0.3 kill -INT 1
```

docker stop 명령은 위험하다.

## 뒷정리
```
# docker rm postgresql-x.x
# docker image rm i386/centos5/postgres:x.x.x
```


## 이 모든 작업을 한꺼번에 하기

### 만들고 지우기
```
./1.runall.sh
./5.cleanall.sh
```

### 실행하고, 사용하기
이 부분은 https://github.com/i0seph/alpine-postgresql 프로젝트의 스크립트를 그대로 사용해도 된다.

