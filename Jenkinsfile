pipeline {
    agent any
    
    environment {
        registry = "infinitengine/spring-petclinic-pipeline"
        registryCredential = 'infinitengine'
        dockerImage = ''
        DOCKERHUB_CREDENTIALS=credentials('infinitengine')
        ARTIFACTORY_ACCESS_TOKEN=credentials('artifactory-access-token')
        ARTIFACTORY_DOCKER_REGISTRY='151.139.55.51:8082/'
        CI = true
    }
  
    stages {
        stage('Build Application') { 
            steps {
                echo '=== Building Petclinic Application ==='
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test Application') {
            steps {
                echo '=== Testing Petclinic Application ==='
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Build Docker Image') {
            when {
                branch 'main'
            }
            steps {
                echo '=== Building Petclinic Docker Image ==='
                script {
                    app = docker.build("infinitengine/spring-petclinic-pipeline")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                echo '=== Logging in to Docker Hub ==='
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo '=== Pushing Image to Docker Hub ==='
                sh 'docker push infinitengine/spring-petclinic-pipeline:latest'
            }
        }
        stage('Push image to Artifactory') {
            rtDocker.push ARTIFACTORY_DOCKER_REGISTRY + 'infinitengine/spring-petclinic-pipeline:latest', 'spring-petclinic-pipeline', buildInfo
        }      
        stage('Remove Unused docker image') {
              steps {
                    echo '=== Removing Local Image ==='
                    sh "docker rmi $registry:latest"
              }
        }
    }
}
