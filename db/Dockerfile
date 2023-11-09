FROM library/postgres
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB db_academy
ADD ini.sql /docker-entrypoint-initdb.d/
ADD db_academy.sql /docker-entrypoint-initdb.d/
