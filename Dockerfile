FROM tomcat:9.0.83-jdk21-temurin

# ⬇️ Copy WAR from target folder
COPY target/OnlineBookStore.war /usr/local/tomcat/webapps/

EXPOSE 8080


CMD ["catalina.sh", "run"]
