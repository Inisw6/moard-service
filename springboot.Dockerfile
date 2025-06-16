FROM gradle:8.5-jdk17 AS build
WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/Inisw6/moard-spring-api.git /app

RUN gradle build --no-daemon -x test

FROM amazoncorretto:17-alpine
WORKDIR /app

RUN apk add --no-cache bash

COPY --from=build /app/build/libs/*.jar app.jar

COPY .env .env

ENV NAVER_CLIENT_ID=""
ENV NAVER_CLIENT_SECRET=""
ENV YOUTUBE_API_KEY=""

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"] 