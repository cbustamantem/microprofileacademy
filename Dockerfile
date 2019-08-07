# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
# copy WAR into image
ENV JAVA_APP_DIR=/opt/
RUN mkdir -p ~/opt
COPY target/MicroProfileAcademyApi-microbundle.jar /opt/MicroProfileAcademyApi-microbundle.jar
RUN file="$(ls -la /opt)" && echo $file

# run application with this command line 
#RUN /usr/bin/java -jar /opt/MicroProfileAcademyApi-microbundle.jar -Dserver.name={SERVER.NAME}
CMD ["/usr/bin/java", "-jar","/opt/MicroProfileAcademyApi-microbundle.jar"]
