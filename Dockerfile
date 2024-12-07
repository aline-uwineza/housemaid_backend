FROM maven:3.9.8-eclipse-temurin-21 AS build

COPY ..

COPY pom.xml 

WORKDIR /app
RUN mvn clean install -U

FROM openjdk:21
COPY --from=build /app/target/PhegonHotel-0.0.1-SNAPSHOT.jar app.jar

WORKDIR /app

EXPOSE 4040

CMD ["java", "-jar", "app.jar"]
