output "public_ip" {
  description	= "public IP address of EC2 instance"
  value		= "${resource.aws_instance.ubuntu.public_ip}"
}
