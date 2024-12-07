# Stage 1: Build the application
FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy the source code to the container
COPY . .

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime container
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the built JAR from the build stage to the runtime stage
COPY --from=build /app/target/PhegonHotel-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your application runs on
EXPOSE 4040

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
