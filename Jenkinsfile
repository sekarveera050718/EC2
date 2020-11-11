node {
  stage ('Build') {
    git 'https://github.com/sekarveera050718/springboot-demo.git'
    sh 'mvn clean install'
  }
  stage('Test'){
    echo 'Testing'
    sh 'mvn test'
   }
        
}
