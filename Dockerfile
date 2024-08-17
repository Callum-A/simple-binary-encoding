FROM gradle:8.10.0-jdk11
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle $APP_HOME

COPY gradle $APP_HOME/gradle
COPY --chown=gradle:gradle . /home/gradle/src
COPY . .
RUN ./gradlew build || return 0

ENTRYPOINT ["./entrypoint.sh"]