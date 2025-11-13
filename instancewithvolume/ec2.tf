resource aws_instance "webserver"{
    ami= "ami-07ad67a0f40310d7a"
    key_name = "kal"
    instance_type = "t3.micro"
    subnet_id = "subnet-00ea1d104ea75caab"
    vpc_security_group_ids = ["sg-041f335a7624677b1"]
    tags = {
        Name = "WebServerInstance"
        env= "dev"
    }
}

resource "aws_ebs_volume" "web_data_volume" {
  availability_zone = "us-west-2a"
  size              = 10
  tags = {
    Name = "WebDataVolume"
    env  = "dev"
  }
}

resource "aws_volume_attachment" "web_data_volume_attachment" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.web_data_volume.id
  instance_id = aws_instance.webserver.id
  depends_on = [ aws_instance.webserver, aws_ebs_volume.web_data_volume ]
}