resource "time_sleep" "delay_configuration" {
  create_duration = "2m"
}

# resource "local_file" "inventory" {
#   filename   = "${path.module}/../ansible/inventory.ini"
#   content    = <<-EOT
#       [webserver]
#       ${aws_instance.this.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file="~/.ssh/id_rsa"
#       EOT
  
#   depends_on = [aws_instance.this, cloudflare_dns_record.dns_record,time_sleep.delay_configuration]


# }


resource "null_resource" "inventory" {

   triggers = {
    instance_ip = aws_instance.this.public_ip
    instance_id = aws_instance.this.id
  }
  depends_on = [
    aws_instance.this,
    cloudflare_dns_record.dns_record,
    time_sleep.delay_configuration
  ]

  provisioner "local-exec" {
    
    command = <<-EOT
      cat > ${path.module}/../ansible/inventory.ini <<EOF
      [webserver]
      ${aws_instance.this.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file="~/.ssh/id_rsa"
      EOF
    EOT
  }
}

resource "null_resource" "provision" {
   triggers = {
    instance_ip = aws_instance.this.public_ip
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${path.module}/../ansible/inventory.ini ${path.module}/../ansible/playbook.yml"
  }

  depends_on = [aws_instance.this, local_file.inventory]
}