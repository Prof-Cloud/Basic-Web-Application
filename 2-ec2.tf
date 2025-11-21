resource "aws_instance" "BasicApp" {
  ami           = data.aws_ami.the_ami.id
  instance_type = "t3.micro"

vpc_security_group_ids = [aws_security_group.BasicApp-SG.id]

user_data = "${file("userdata.sh")}"

  tags = {
    Name = "BasicApp"
  }
}

