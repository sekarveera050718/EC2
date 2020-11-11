node {
  stage ('Build') {
    git 'https://github.com/madhusakthivel/springboot-demo.git'
    sh 'mvn clean install'
  }
  stage('Test'){
    echo 'Testing'
    sh 'mvn test'
   }
        
}
