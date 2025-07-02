FROM tomcat:9.0.83-jdk21-temurin

# ✅ Copy latest WAR file from Maven build
COPY target/OnlineBookStore.war /usr/local/tomcat/webapps/OnlineBookStore.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
