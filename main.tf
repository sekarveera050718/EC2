provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "Ubuntu" {
	ami = "ami-03f0fd1a2ba530e75"
	instance_type = "t2.micro"
	key_name = "demokey"
	user_data = "${file("install_java.sh")}"
	tags = {
		Name = "Jenkins-EC2-Java"	
		}
}
