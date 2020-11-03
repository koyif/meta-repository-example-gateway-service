FROM adoptopenjdk/openjdk11:x86_64-alpine-jre-11.0.6_10
RUN apk --no-cache add curl

HEALTHCHECK --interval=30s --timeout=10s --start-period=100s --retries=30 CMD curl -f http://localhost:8080/actuator/health/check || exit 1

ENTRYPOINT ["java", "-jar", "gateway-service-0.0.1-SNAPSHOT.jar"]

WORKDIR /app
COPY target/gateway-service-0.0.1-SNAPSHOT.jar /app/gateway-service-0.0.1-SNAPSHOT.jar
