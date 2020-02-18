#FROM openjdk:8

#ENV SBT_VERSION 0.13.15

#RUN \
  #curl -L -o sbt-0.13.15.deb http://dl.bintray.com/sbt/debian/sbt-0.13.15.deb && \
  #dpkg -i sbt-0.13.15.deb && \
  #rm sbt-0.13.15.deb && \
  #apt-get update && \
  #apt-get install sbt && \
  #sbt sbtVersion
  
FROM openjdk:8
ENV SBT_VERSION 0.13.15

# Install sbt
RUN apt-get update
RUN apt-get install -y default-jre-headless
RUN apt-get -y install openjdk-8-jdk
RUN curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb
RUN dpkg -i sbt-$SBT_VERSION.deb
RUN apt-get -y install sbt

WORKDIR /HelloWorld

COPY . /HelloWorld

CMD sbt run
