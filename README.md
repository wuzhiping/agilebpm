# agilebpm-base-spring-boot

[www.agilebpm.cn/zh-cn/docs/bootstrap.html](agilebpm)

~~docker run --rm  -it -p 8080:8080 shawoo/agilebpm mvn org.mortbay.jetty:maven-jetty-plugin:run~~
~~http://localhost:8080/bpm-explorer~~

docker-compose up -d mysqlmaster

[https://gitee.com/agile-bpm/agile-bpm-basic/tree/master/_doc/mysql](doc_mysql)

~~mysqldump -h 47.106.140.247 -upublic -p public>public.sql~~

docker exec -it agilebpm_mysqlmaster_1 /bin/bash
#
mysql -uroot -p

CREATE DATABASE IF NOT EXISTS agilebpm DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

#
cd /var/lib/mysql

ls

~~# mysql -u root -p agilebpm<./sql/mysql/create/1~n.sql~~

# mysql -u root -p agilebpm<agilebpm.sql


#
docker-compose up -d

http://localhost:8080

http://domainName:85

# agilebpm-ui
/opt/agilebpm-base-spring-boot/agilebpm-ui/src/main/resources/static/agilebpm-ui

# UI For Mobile
## git clone https://gitee.com/agile-bpm/bpm-app.git
## bpm-app/src/service/common/baseService.js
## docker run --rm  -it -v $PWD/bpm-app:/opt/bpm-app -w /opt/bpm-app shawoo/bpm npm run build

# Camunda

docker pull camunda/camunda-bpm-platform:latest

docker run --rm -it --name camunda -p 8181:8080 camunda/camunda-bpm-platform:latest

# open browser with url: http://localhost:8181/camunda-welcome/index.html
