
docker container rm microprofileacademy
docker image rm jakartaee/microprofileacademy
mvn clean install
docker build -t jakartaee/microprofileacademy .
