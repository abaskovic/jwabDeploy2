FROM maven:3.8.5-openjdk-17 AS build
COPY ../jw .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --frombuild /target/jw-0.1.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]