node {
    stage('Clone repository') {
        git credentialsId: 'github-credentials', url: 'https://github.com/sekarveera050718/EC2.git'
    }
    stage('Compile') {
        sh 'javac *.java'
    }
    stage('Build Jar') {
        sh 'jar cvfm sample.jar  manifest.txt *.class'
    }
	
    
}
