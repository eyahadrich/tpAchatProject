 openjdk:11
EXPOSE 8089

WORKDIR /usr/app

COPY ./target/achat-*.jar /usr/app/

CMD java -jar achat-*.jar
