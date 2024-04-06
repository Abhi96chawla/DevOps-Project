# Use an appropriate base image with JDK installed
FROM maven:3.8.3-jdk-11 AS build
# Set the working directory in the container

RUN git clone https://github.com/DeepakChandMarthala/DevOps-Project.git /app

WORKDIR /app

 
RUN mvn clean package
 
# Copy the JAR file from the build stage to the container
COPY target/*.jar app.jar
 
# Expose the port that your Spring Boot application runs on
EXPOSE 8085
 
# Command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
