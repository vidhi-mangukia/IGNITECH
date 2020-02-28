FROM centos:7

COPY jenkins.war .

RUN yum install -y java-1.8.0-openjdk

RUN java -version

CMD ["java","-jar","jenkins.war"]

