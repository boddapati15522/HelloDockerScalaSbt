FROM openjdk:8

ENV SBT_VERSION 0.13.15

RUN \
  rm -rf /var/lib/apt/lists && \
  mkdir /var/lib/apt/lists && \
  wget http://apt.typesafe.com/repo-deb-build-0002.deb && \
  dpkg -i repo-deb-build-0002.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion && \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb
  

WORKDIR /HelloWorld

COPY . /HelloWorld

CMD sbt run
