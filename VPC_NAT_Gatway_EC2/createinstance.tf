provider "aws" {
	region  = "ap-south-1"
}
resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"

  tags = {
    Name = "custom_instance"
  }


  

  provisioner "file" {
      source = "installNginx.sh"
      destination = "/tmp/installNginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh",  # Remove the spurious CR characters.
      "sudo /tmp/installNginx.sh",
    ]
  }
}