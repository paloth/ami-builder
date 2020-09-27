# Deployment inputs

variable "profile" {
  type        = string
  description = "Your aws profile (Must have the EC2 access right)"
  default     = "default"
}

variable "region" {
  type        = string
  description = "The aws region where you want to build your aws AMI"
  default     = "eu-west-1"
}

# Build inputs

variable "communicator" {
  type = object({
    communicator = string
    port         = number
    username     = string
  })
  description = "The configuration for the ssh communicator"
  default = {
    communicator = "ssh"
    port         = 22
    username     = "ec2-user"
  }
}

variable "instance_type" {
  type        = string
  description = "The instance type to use to build your aws AMI"
  default     = "t3.micro"
}

variable "vpc_id" {
  type        = string
  description = "The vpc Id to use to build your aws AMI"
}

variable "subnet_id" {
  type        = string
  description = "The subnet Id to use to build your aws AMI"
}

variable "source_ami_filter" {
  type = object({
    virtualization = string
    regex          = string
    device         = string
    owners         = list(string)
  })
  description = "The filter parameters to find the source aws AMI"
  default = {
    virtualization = "hvm"
    regex          = "amzn2-ami-hvm-2.0.*-gp2"
    device         = "ebs"
    owners         = ["amazon"]
  }
}

# AMI inputs

variable "ami_name" {
  type        = string
  description = "Your aws AMI name"
}

variable "os_version" {
  type        = string
  description = "Your aws AMI version"
}

variable "tags" {
  type        = map(string)
  description = "Your aws AMI tags"
  default     = {}
}
