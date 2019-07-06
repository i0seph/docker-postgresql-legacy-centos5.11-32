#!/bin/sh

#for ver 5.x
for i in 5.0 5.1
do
	docker build -t i386/centos5/postgres:$i --build-arg PGVER=$i .
	docker run -it --name postgresql-$i i386/centos5/postgres:$i
done

#for ver 6.x
for i in 6.0 6.1.1 6.2.1 6.3.2 6.4.2 6.5.3
do
	shortpgver=`echo $i | cut -d '.' -f 1-2`
	docker build -t i386/centos5/postgres:$i --build-arg PGVER=$i .
	docker run -it --name postgresql-$shortpgver -e PGLIB=/postgres/$i/lib i386/centos5/postgres:$i
done

#for ver 7.x
docker build -t i386/centos5/postgres:7.0.3 --build-arg PGVER=7.0.3 .
docker run -it --name postgresql-7.0 i386/centos5/postgres:7.0.3 -E unicode
