FROM flyway/flyway

COPY ./sql/*.sql ./sql

# jdbc:mysql://${DBinstance.Endpoint.Address}:3306/csye6225

ENV FLYWAY_URL=jdbc:mysql://todo.cob9le38a3hn.us-east-1.rds.amazonaws.com:3306/todo
ENV FLYWAY_USER=root
ENV FLYWAY_PASSWORD=password

CMD [ "info", "migrate" ]