# -------- stage1 - jar builder --------

# Maven image
FROM maven:3.8.3-openjdk-17 AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml first for better layer caching
COPY pom.xml /app/

# Download dependencies (cached layer)
RUN mvn dependency:go-offline

# Copy source code from local to container
COPY src /app/src

# Build application and skip test cases
RUN mvn clean package -DskipTests=true

# EXPOSE is not required in build stage
# EXPOSE 8080

# ENTRYPOINT is not required in build stage
# ENTRYPOINT ["java", "-jar", "/expenseapp.jar"]

#--------------------------------------
# Stage 2 - app build
#--------------------------------------

# Import small size java image
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy build from stage 1 (builder)
COPY --from=builder /app/target/*.jar /app/expenseapp.jar

# Expose application port
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "/app/expenseapp.jar"]
