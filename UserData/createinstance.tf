provider "aws" {
	region  = "ap-south-1"
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1b" 
  key_name  = "My-Key-MuM-2425"
  user_data = file.(installapache.sh)
  tags = {
    Name = "Userdata"
  }
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip
}
