pipeline {
    agent any
    stages {
        stage('one') {
            steps {
                sh 'exit 0'
            }
        }
        stage('two') {
            steps {
                sh 'exit 1'   // failure
            }
        }
    }
    post {
        always {
            sh 'exit 0'
        }
    }
}
