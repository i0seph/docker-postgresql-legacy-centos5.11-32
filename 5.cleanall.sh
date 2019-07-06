#!/bin/sh
docker rm postgresql-5.0 postgresql-5.1 postgresql-6.0 postgresql-6.1 postgresql-6.2 postgresql-6.3 postgresql-6.4 postgresql-6.5 postgresql-7.0 
docker image rm i386/centos5/postgres:5.0 i386/centos5/postgres:5.1 i386/centos5/postgres:6.0 i386/centos5/postgres:6.1.1 i386/centos5/postgres:6.2.1 i386/centos5/postgres:6.3.2 i386/centos5/postgres:6.4.2 i386/centos5/postgres:6.5.3 i386/centos5/postgres:7.0.3
