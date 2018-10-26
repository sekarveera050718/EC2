output "public_ip" {
  description	= "public IP address of EC2 instance"
  value		= "${module.ec2_cluster.public_ip}"
}
