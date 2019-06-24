# agilebpm-base-spring-boot

[www.agilebpm.cn/zh-cn/docs/bootstrap.html](agilebpm)

~~docker run --rm  -it -p 8080:8080 shawoo/agilebpm mvn org.mortbay.jetty:maven-jetty-plugin:run~~
~~http://localhost:8080/bpm-explorer~~

docker-compose up -d mysqlmaster

docker exec -it agilebpm_mysqlmaster_1 mysql -uroot -p
#
CREATE DATABASE IF NOT EXISTS agilebpm DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
sql 1~n
#
docker-compose up -d

http://localhost:8080
