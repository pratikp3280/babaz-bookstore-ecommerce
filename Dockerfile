FROM tomcat:9.0.83-jdk21-temurin

# ✅ Copy latest WAR file from Maven build
COPY target\OnlineBookStore-0.0.1-SNAPSHOT.war target\OnlineBookStore.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
