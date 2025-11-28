# resource "tls_private_key" "rsa_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096 # Stronger key size
# }

# # 2. Upload the generated public key to AWS
# resource "aws_key_pair" "ec2-key" {
#   key_name = "dynamic-ubuntu-key"
#   # Use the public_key_openssh attribute from the generated key
#   public_key = tls_private_key.rsa_key.public_key_openssh
# }

# # 3. Save the private key to a file locally for future use
# # WARNING: This key is sensitive. Ensure this file is properly secured!
# resource "local_file" "private_key" {
#   content  = tls_private_key.rsa_key.private_key_pem
#   filename = "${path.module}/dynamic-ubuntu-key.pem"
#   # Optional: ensure only the owner can read the file
#   file_permission = "0400"
# }
resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")
}