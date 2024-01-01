provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami = "${data.aws_ami.ubuntu.id}"  # get the latest AMI ID through data resource query 
  #ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  subnet_id = "subnet-0193b8974abab6dad"
  key_name = "aws-kvp"
}

data "aws_ami" "ubuntu" {
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# to store the ami.id in the output varible 
output ami_id {
    value = data.aws_ami.ubuntu.id
}


/*
Owner account id:  099720109477
owner alias: amazon
source: amazon/ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516	
AMI Name: ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516
*/
/*
 data "aws_ami" "ubuntu" {
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output ami_id {
    value = data.aws_ami.ubuntu.id
}
*/
/*
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"] # Canonical
}

output ami_id {
    value = data.aws_ami.ubuntu.id
}

*/