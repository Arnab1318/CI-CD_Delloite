FROM tomcat:8-jre8

ADD  target/addressbook.war /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]
