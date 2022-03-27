pipeline {
    agent any
    
    environment {
        registry = "infinitengine/spring-petclinic-pipeline"
        registryCredential = 'infinitengine'
        dockerImage = ''
        DOCKERHUB_CREDENTIALS=credentials('infinitengine')
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
        stage('Login') {

                steps {
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
        }

        stage('Push') {

                steps {
                        sh 'docker push infinitengine/spring-petclinic-pipeline:latest'
                }
        }
        stage('Remove Unused docker image') {
              steps {
                sh "docker rmi $registry:latest"
              }
        }
    }
}
