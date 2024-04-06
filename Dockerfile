# Use an appropriate base image with JDK installed
FROM openjdk:11-jre-slim
 
# Set the working directory in the container
WORKDIR /app
 
RUN mvn clean package
 
# Copy the JAR file from the build stage to the container
COPY target/*.jar app.jar
 
# Expose the port that your Spring Boot application runs on
EXPOSE 8083
 
# Command to run the Spring Boot application
CMD ["java", "-jar", "app.jar"]
