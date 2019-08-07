# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
# copy WAR into image
ARG SERVER.NAME
ARG SERVER.PORT
ARG SERVER.DBNAME
ARG SERVER.USER
ARG SERVER.PASSWD
ENV JAVA_APP_DIR=/opt/
ENV server.name=$SERVER.NAME
ENV server.dbname=$SERVER.DBNAME
ENV server.port=$SERVER.PORT
ENV server.user=$SERVER.USER
ENV server.passwd=$SERVER.PASSWD
RUN mkdir -p ~/opt
COPY target/MicroProfileAcademyApi-microbundle.jar /opt/MicroProfileAcademyApi-microbundle.jar
RUN file="$(ls -la /opt)" && echo $file

# run application with this command line 
#RUN /usr/bin/java -jar /opt/MicroProfileAcademyApi-microbundle.jar -Dserver.name={SERVER.NAME}
CMD ["/usr/bin/java", "-jar","-Dserver.name={$SERVER.NAME}", "-Dserver.dbname={$SERVER.DBNAME}","-Dserver.port={$SERVER.PORT}","-Dserver.user={$SERVER.USER}","-Dserver.passwd={$SERVER.PASSWD}","/opt/MicroProfileAcademyApi-microbundle.jar"]
