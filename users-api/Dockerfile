FROM maven:3.9.6-eclipse-temurin-8 AS build

WORKDIR /app

COPY pom.xml .

# Pre-download dependencies
RUN mvn dependency:go-offline -B

# Now copy source code
COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:8-jre-alpine

# FROM eclipse-temurin:17-jre-alpine
# FROM openjdk:8-jdk-alpine
WORKDIR /app

COPY --from=build /app/target/users-api-0.0.1-SNAPSHOT.jar /app/users-api.jar

EXPOSE 8083

ENTRYPOINT ["java", "-jar", "users-api.jar"]