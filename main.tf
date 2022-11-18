provider "aws" {
    region = var.aws_region
}

# create security group with firewall rules
resource "aws_security_group" "my_security_group" {
    name = var.security_group
    description = "Security group for EC2 instance"

    # allow access on port 8080
    ingress {
        from_port        = 8080
        to_port          = 8080
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    # outbound from Jenkins server
    ingress {
        from_port        = 0
        to_port          = 65535
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags= {
        Name = var.security_group
    }
}

# create AWS EC2 instance
resource "aws_instance" "myFirstInstance" {
    ami = var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    security_groups = [var.security_group]
    tags= {
        Name = var.tag_name
    }
}

# create elastic IP address
resource "aws_eip" "myFirstInstance" {
    vpc = true
    instance = aws_instance.myFirstInstance.id
    tags= {
        Name = "my_elastic_ip"
    }
}
