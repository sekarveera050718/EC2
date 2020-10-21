provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "Ubuntu" {
	ami = "ami-03f0fd1a2ba530e75"
	instance_type = "t2.micro"
	key_name = "demokey"
	user_data = << EOF
		#! /bin/bash
		sudo apt-get update
		sudo apt install -y default-jre
		sudo apt install -y openjdk-11-jre-headless
		sudo apt install -y openjdk-8-jre-headless
    EOF
	tags = {
		Name = "Jenkins-EC2-Java"	
		}
}
