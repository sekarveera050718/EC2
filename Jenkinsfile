pipeline {
	agent any
	stages {
		stage('Clone repository') {
			steps {
				git credentialsId: 'github-credentials', url: 'https://github.com/maheshmadmax/java4-EC2.git'
			}
		}
	}
}
	
