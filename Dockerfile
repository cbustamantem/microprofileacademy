# Alpine Linux with OpenJDK JRE
FROM amazoncorretto:11-alpine3.17
# copy WAR into image
ENV JAVA_APP_DIR=/opt/
RUN mkdir -p ~/opt
COPY target/microprofile-academy.jar /opt/microprofile-academy.jar
RUN file="$(ls -la /opt)" && echo $file

# run application with this command line 
#RUN /usr/bin/java -jar /opt/microprofile-academy.jar -Dserver.name={SERVER.NAME}
#CMD ["/usr/bin/java", "-jar","/opt/microprofile-academy.jar"]
CMD ["/usr/bin/java", "-jar","/opt/microprofile-academy.jar", "-b","0.0.0.0"]

