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
    stage("Deploy Jar to AWS") {
		// Deploy sample.jar to AWS
	sh ("scp -i demokey.pem sample.jar ubuntu@${env.public_ip}:/home/ubuntu/")
	sh ("ssh -o StrictHostKeyChecking=no -i /home/ubuntu/.aws/demokey.pem ubuntu@${env.public_ip} 'java -jar sample.jar'")
	   // sh ("echo ${env.public_ip}")
	}
	//stage("Clean up with TerraForm") {
		// Destroys the earlier created EC2 T2.micro instance
	//	sh("~/terraform destroy -input=false -auto-approve")
	//}
}
