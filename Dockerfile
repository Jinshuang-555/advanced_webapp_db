FROM flyway/flyway

COPY ./sql/*.sql ./sql

ENV FLYWAY_URL=jdbc:todo.cob9le38a3hn.us-east-1.rds.amazonaws.com:3306/todo
ENV FLYWAY_USER=root
ENV FLYWAY_PASSWORD=password

# CMD [ "info", "migrate" ]