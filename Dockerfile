FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY build/war/ /usr/local/tomcat/webapps/HospitalManagementSystem/

CMD sed -i "s/port=\"8080\"/port=\"${PORT:-10000}\"/" /usr/local/tomcat/conf/server.xml && catalina.sh run