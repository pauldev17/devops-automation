FROM adoptopenjdk/openjdk11:alpine-jre
EXPOSE 8080
ADD target/*.jar devops-integration.jar
ENTRYPOINT ["java", "-jar", "devops-integration.jar"]