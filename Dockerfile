FROM maven:latest AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
# Rutime
FROM eclipse-temurin:17-jre-alpine-3.23
WORKDIR /petclinic
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java" ,"-jar" , "app.jar" ]

