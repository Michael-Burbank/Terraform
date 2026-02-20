# This is a simple Terraform configuration to create an EC2 instance using the latest Amazon Linux 2023 AMI with kernel version 6.12 for x86_64 architecture.

# The AMI ID is retrieved from the AWS Systems Manager Parameter Store, which provides the latest AMI ID for the specified criteria.
data "aws_ssm_parameter" "al2023_612" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.12-x86_64"
}

# AMI references the value retrieved from the SSM parameter store, ensuring that the EC2 instance will use the latest available AMI for Amazon Linux 2023 with kernel version 6.12.
resource "aws_instance" "myTerraformInstance" {
  ami           = data.aws_ssm_parameter.al2023_612.value
  instance_type = "t2.nano"
  monitoring    = false

  tags = {
    Name = "LearningTerraformEC2Instance"
  }
}

