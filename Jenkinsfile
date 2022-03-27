pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                ./mvnw package
                java -jar target/*.jar
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}
