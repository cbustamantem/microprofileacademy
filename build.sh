
docker container rm microprofileacademy
docker image rm ougpy/microprofileacademy
mvn clean install
docker build -t ougpy/microprofileacademy .
