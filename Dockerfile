# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine

EXPOSE 8181

# copy jar into image
COPY /var/lib/jenkins/workspace/Spring_Pet_Clinic_Pipeline_main/target/spring-petclinic-2.6.0.BUILD-SNAPSHOT.jar /usr/bin/spring-petclinic.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar","--server.port=8181"]
