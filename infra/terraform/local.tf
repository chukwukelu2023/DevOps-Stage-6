resource "local_file" "inventory" {
  filename   = "${path.module}/../ansible/inventory.ini"
  content    = <<-EOT
[webserver]
${aws_instance.this.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file="${path.module}/../terraform/dynamic-ubuntu-key.pem"
EOT
  depends_on = [aws_instance.this, cloudflare_dns_record.dns_record]


}


resource "null_resource" "provision" {
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${path.module}/../ansible/inventory.ini ${path.module}/../ansible/playbook.yml"
  }

  depends_on = [aws_instance.this, local_file.inventory]

}