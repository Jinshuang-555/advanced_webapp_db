FROM flyway/flyway

COPY ./sql/*.sql ./sql

ENV FLYWAY_URL=jdbc:mysql://host.docker.internal:3306/todo
ENV FLYWAY_USER=root
ENV FLYWAY_PASSWORD=password

CMD [ "info", "migrate" ]