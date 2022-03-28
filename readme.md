# Jenkins Pipeline for Spring PetClinic 

## Introduction
This is an example Jenkins pipeline using the Spring pet-clinic ([https://github.com/spring-projects/spring-petclinic](https://github.com/spring-projects/spring-petclinic))

## Docker Hub Images
A valid working Docker Hub image **spring-petclinic-pipeline** is stored here:
https://hub.docker.com/repository/docker/infinitengine/spring-petclinic-pipeline

## Prerequisites

 1. Jenkins installed on a VM or Container 
 2. Docker installed 
 3. Docker Hub
 4. Github Repository

## Running the Project

1.  Clone the below repository:
**git clone https://github.com/talitz/spring-petclinic-jenkins-pipeline.git**
2.  Install Jenkins on a VM or Docker Container
3.  After logging in navigate to **Manage Plugins** install Github, Docker Build Push, and jFrog Artifactory (optional)
4.  Navigate to **Manage Credentials** and add your token for Docker Hub.
5.  Optionally add your Access Token for jFrog

Once set up has been complete click Build Now to run the pipeline.  The pipeline will run the following steps.


![enter image description here](https://i.ibb.co/SmYZXpm/Screenshot-from-2022-03-28-16-10-34.png)

## Running the Docker Image

A current valid and working Docker Image is stored at: 
https://hub.docker.com/repository/docker/infinitengine/spring-petclinic-pipeline

Pull the latest spring-petclinic-pipeline image from the dockerhub repository:  
`docker pull infinitengine/spring-petclinic-pipeline`

Run the container using:  
`docker run -d --name petclinic-container -p 8181:8181 infinitengine/spring-petclinic-pipeline`

Navigate to  `http://ipaddress:8181`  

You should see the below application:

![enter image description here](https://i.ibb.co/fDx2Pnj/Screenshot-from-2022-03-28-16-18-26.png)
