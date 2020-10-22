node {
	def build_ok = true
    stage('Clone repository') {
        git credentialsId: 'github-credentials', url: 'https://github.com/maheshmadmax/java4-EC2.git'
	    sh 'exit 0'
    }
    stage('Compile') {
        sh 'javac *.java'
	    sh 'exit 0'
    }
    stage('Build Jar') {
        sh 'jar cvfm sample.jar  manifest.txt *.class'
	    sh 'exit 0'
    }
	stage("Create EC2 instance with TerraForm") {
		// Creates EC2 T2.micro instance with Tomcat installed on it
		sh("~/terraform init; ~/terraform apply -input=false -auto-approve")
		env.public_ip = sh(returnStdout: true, script: "~/terraform output public_ip").trim()
		sh 'exit 0'
	}
	try {
		stage("Deploy Jar to AWS") {
		// Deploy sample.jar to AWS
	//sh 'scp -r sample.jar -o StrictHostKeyChecking=no -i /home/ubuntu/.aws/demokey ubuntu@${env.public_ip}:/home/ubuntu/'
	sh 'ssh -o StrictHostKeyChecking=no -i /home/ubuntu/.aws/demokey ubuntu@${env.public_ip} "java -jar sample.jar"'
	              sh 'exit 1'
                
	    }  
	   
	}
	stage("Clean up with TerraForm") {
		// Destroys the earlier created EC2 T2.micro instance
		sh("~/terraform destroy -input=false -auto-approve")
		sh 'exit 0'
	}
}
