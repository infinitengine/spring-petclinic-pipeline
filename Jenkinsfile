pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn compile' //only compilation of the code
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
