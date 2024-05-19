# Use the official Maven image with JDK 8
FROM maven:3.8.5-openjdk-8

# Set the working directory
WORKDIR /app

# Copy the project's pom.xml and install dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the project source code
COPY src ./src

# Package the application
RUN mvn package

# Default command
CMD ["mvn", "clean", "test", "-Dselenide.remote=http://host.docker.internal:4444/wd/hub"]
