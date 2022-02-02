resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "dove-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dove-pub-1.id
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-stack-sg.id]
  tags = {
    Name = "my-dove"
  }
}

resource "aws_ebs_volume" "volume_4_dove" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extra-volume-4-dove"
  }
}

resource "aws_volume_attachment" "attch_volume_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.volume_4_dove.id
  instance_id = aws_instance.dove-instance.id
}

output "PublicIp" {
  value = aws_instance.dove-instance.public_ip
}