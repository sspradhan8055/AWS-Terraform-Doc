provider "aws" {
	region  = "ap-south-1"
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a" 
  key_name  = "My-Key-MuM-2425"
  vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
  subnet_id = aws_subnet.levelupvpc-public-1.id

  tags = {
    Name = "mariadb"
  }
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip
}
