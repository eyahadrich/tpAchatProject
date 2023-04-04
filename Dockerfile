FROM openjdk:11-jre-alpine

EXPOSE 8089



WORKDIR /usr/app

COPY ./target/achat-*.jar /usr/app/

CMD java -jar achat-*.jar
