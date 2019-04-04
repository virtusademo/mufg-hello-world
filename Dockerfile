FROM ubuntu:16.04
# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && apt install -y maven && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV MAVEN_HOME=/usr/share/maven

WORKDIR /var/lib/jenkins/workspace/test
COPY ./ .
#
# Define working directory.
RUN mvn clean install

ENTRYPOINT ["java", "-jar", "/root/.m2/repository/com/mufg/mufg-hello-world/0.0.1-SNAPSHOT/mufg-hello-world-0.0.1-SNAPSHOT.jar"]
