provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARJY6ZPXPUAGNRYPQ"
  secret_key = "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"
}
resource "aws_instance" "myec2" {
   ami = "ami-0e731c8a588258d0d"
   instance_type = "t2.micro"
   key_name = "terraform-key"

    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("terraform-key.pem")
    host     = self.public_ip
     }

  provisioner "remote-exec" {
    inline = [
      #Updating with the latest command for Amazon Linux machine
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}