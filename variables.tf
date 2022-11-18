variable "aws_region" {
    description = "The AWS region to create the infrastructure in"
    default = "eu-north-1"
}

variable "key_name" {
    description = "SSH key to use with the EC2 instance"
    default = "forPortfolioEC2InstancesTest"
}

variable "instance_type" {
    description = "instance type for EC2"
    default = "t3.micro"
}

variable "security_group" {
    description = "name of security group"
    default = "my_jenkins_security_group"
}

variable "tag_name" {
    description = "tag name for EC2 instance"
    default = "my_ec2_instance"
}

variable "ami_id" {
    description = "AMI for Ubuntu Ec2 instance"
    default = "ami-0b9064170e32bde34"
}
