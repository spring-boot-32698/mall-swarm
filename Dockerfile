# syntax=docker/dockerfile:1
# Generic image for every Spring Boot module of mall-swarm.
# Build with: docker build --build-arg MODULE=mall-admin -t mall/mall-admin .

FROM maven:3.9-eclipse-temurin-17 AS build
ARG MODULE
WORKDIR /src
COPY . .
# docker.skip disables the docker-maven-plugin that is bound to the package phase
RUN --mount=type=cache,target=/root/.m2 \
    mvn -B --no-transfer-progress -s docker/maven-settings.xml -pl ${MODULE} -am package -DskipTests -Ddocker.skip=true \
    && cp ${MODULE}/target/${MODULE}-*.jar /app.jar

FROM eclipse-temurin:17-jre
ENV TZ=Asia/Shanghai \
    JAVA_OPTS=""
COPY --from=build /app.jar /app.jar
ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -Dspring.profiles.active=prod -jar /app.jar"]
