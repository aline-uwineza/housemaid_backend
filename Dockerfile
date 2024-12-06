# Use an official JDK runtime as a parent image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from your build output to the container
COPY target/PhegonHotel-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your application runs on
EXPOSE 4040

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
