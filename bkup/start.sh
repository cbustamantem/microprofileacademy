docker run  --rm  -p 18080:8080  \
	--env SERVER.NAME=testdb \
	--env SERVER.PORT=5432 \
	--env SERVER.USER=docker \
	--env SERVER.PASSWD=docker \
	--env SERVER.DBNAME=db_academy \
       	--network=br0   --name=test_microprofileacademy ougpy/microprofileacademy
