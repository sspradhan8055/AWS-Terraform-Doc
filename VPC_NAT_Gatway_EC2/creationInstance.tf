resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
  subnet_id = aws_subnet.levelupvpc-public-2.id
  tags = {
    Name = "terrafom-elb"
  }
}

