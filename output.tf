output "public_ip" {
  description	= "public IP address of EC2 instance"
  value		= ["${local.this_public_ip}"]
}
