FROM maven:3.9.8-eclipse-temurin-21 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml and the src folder to the container
COPY pom.xml /app/
COPY src /app/src/

# Build the application using Maven
RUN mvn clean install -U

# Stage 2: Create the runtime container
FROM openjdk:21

# Set the working directory to /app
WORKDIR /app

# Copy the built JAR file from the build stage to the runtime container
COPY --from=build /app/target/PhegonHotel-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port the application will run on
EXPOSE 4040

# Command to run the application
CMD ["java", "-jar", "app.jar"]
