provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-west-2"
}

resource "aws_instance" "ec2nginx" {
  ami           = "ami-032509850cf9ee54e"
  instance_type = "t2.micro"
  subnet_id     = "subnet-07c6811d5a119875c"
  key_name      = "Ec2KeyPair"
  associate_public_ip_address = "true"
  security_groups = ["sg-0df871cb89d78602d"]
  tags = {
    type = "Nginx_Server"
    Name = "Nginx_Server"
  }
}

resource "aws_instance" "ec2firsttomcat" {
  ami           = "ami-032509850cf9ee54e"
  instance_type = "t2.micro"
  subnet_id     = "subnet-01383d6fcf8472c81"
  key_name      = "Ec2KeyPair"
  associate_public_ip_address = "false"
  security_groups = ["sg-059a0455a434a0929"]
  tags = {
    type = "First_Tomcat_Server"
    Name = "First_Tomcat_Server"
  }
}

resource "aws_instance" "ec2secondtomcat" {
  ami           = "ami-032509850cf9ee54e"
  instance_type = "t2.micro"
  subnet_id     = "subnet-01383d6fcf8472c81"
  key_name      = "Ec2KeyPair"
  associate_public_ip_address = "false"
  security_groups = ["sg-059a0455a434a0929"]
  tags = {
    type = "Second_Tomcat_Server"
    Name = "Second_Tomcat_Server"
  }
}

resource "aws_instance" "ec2mysql" {
  ami           = "ami-005bdb005fb00e791"
  instance_type = "t2.micro"
  subnet_id     = "subnet-01383d6fcf8472c81"
  key_name      = "Ec2KeyPair"
  associate_public_ip_address = "false"
  security_groups = ["sg-059a0455a434a0929"]
  tags = {
    type = "MySQL_Server"
    Name = "MySQL_Server"
  }
}
