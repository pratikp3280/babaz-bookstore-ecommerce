FROM tomcat:9.0.79-jdk17-temurin

COPY OnlineBookStore.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
