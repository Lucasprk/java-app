FROM adoptopenjdk/openjdk11:alpine

COPY build/distributions/*boot*.zip /java-app.zip

RUN unzip -o java-app && \
  rm -rf *.zip && \
  mv java-app-* java-app

ENTRYPOINT [ "/java-app/bin/java-app", "-Djava.security.egd=file:/dev/./urandom" ]