FROM flyway/flyway

COPY ./sql/*.sql ./sql

ENV FLYWAY_URL=jdbc:mysql://host.docker.internal:3306/todo
ENV FLYWAY_USER=root
ENV FLYWAY_PASSWORD=Njs862459063!

CMD [ "info", "migrate" ]