provider "aws" {
	profile = "default"
	region = "ap-south-1"
	shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

resource "aws_instance" "Ubuntu" {
	ami = "ami-03f0fd1a2ba530e75"
	instance_type = "t2.micro"
	associate_public_ip_address = true
	key_name = "demokey"
	user_data = "${file("install_java.sh")}"
	tags = {
		Name = "Jenkins-EC2-Java"	
		}
}
