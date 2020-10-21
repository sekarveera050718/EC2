output "public_ip" {
  description	= "public IP address of EC2 instance"
  value		= "${aws_instance.Ubuntu.public_ip}"
}
