FROM openjdk:latest
RUN mkdir -p /app
WORKDIR /app
COPY . .
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "./target/springbootapp.jar"] 