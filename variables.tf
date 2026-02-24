variable "aws_region" {
    description = "The AWS region to deploy resources in."
    type        = string
    default     = "us-west-1"

}
variable "aws_profile" {
    description = "The AWS CLI profile to use for authentication."
    type        = string
}

variable "instance_type" {
    description = "The type of EC2 instance to create."
    type        = string
    default     = "t2.nano"
}
