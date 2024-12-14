Provide "aws" {
	region  = "ap-south-1"
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  
  tags = {
    Name = "custom-instance"
  }
}

#EBS resource Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "ab-south-1a"
  size              = 15
  type              = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

#Atatch EBS volume with AWS Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.MyFirstInstnace.id
}
