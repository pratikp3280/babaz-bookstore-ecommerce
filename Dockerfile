FROM tomcat:9.0.79-jdk17-temurin

# ⬇️ Copy WAR from target folder
COPY target/OnlineBookStore.war /usr/local/tomcat/webapps/

EXPOSE 8080


CMD ["catalina.sh", "run"]
