output "public_ip" {
  description	= "public IP address of EC2 instance"
  value		= ["${ec2_cluster.this_public_ip}"]
}
