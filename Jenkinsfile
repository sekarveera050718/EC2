node {
    stage('Clone repository') {
        git credentialsId: 'github-credentials', url: 'https://github.com/maheshmadmax/java4-EC2.git'
    }
    stage('Compile') {
        sh 'javac *.java'
    }
    stage('Build Jar') {
        sh 'jar cvfm sample.jar  manifest.txt *.class'
    }
	stage("Create EC2 instance with TerraForm") {
		// Creates EC2 T2.micro instance with Tomcat installed on it
		sh("~/terraform init; ~/terraform apply -input=false -auto-approve")
		env.public_ip = sh(returnStdout: true, script: "~/terraform output public_ip").trim()
	}
   // stage("Deploy Jar to AWS") {
		// Deploy sample.jar to AWS
	//sh 'scp -r /var/lib/jenkins/workspace/balaji/java3/sample.jar -o StrictHostKeyChecking=no -i /home/ubuntu/.aws/demokey ubuntu@${env.public_ip}:/home/ubuntu/'
	//sh 'ssh -o StrictHostKeyChecking=no -i /home/ubuntu/.aws/demokey ubuntu@${env.public_ip} "java -jar sample.jar"'
	//}
	stage("Clean up with TerraForm") {
		// Destroys the earlier created EC2 T2.micro instance
		sh("~/terraform destroy -input=false -auto-approve")
	}
}
