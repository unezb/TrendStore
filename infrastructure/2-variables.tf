variable "region" {
  description = "The default AWS region"
  type        = string
}

variable "name_prefix" {
  description = "The prefix used for AWS resources"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR range to be used for VPC"
  type        = string
}

variable "vpc_az" {
  description = "The availabilty zones for the VPC"
  type        = list(string)
}

variable "pub_sub" {
  description = "The CIDR range for public subnet"
  type        = list(string)
}

variable "priv_sub" {
  description = "The CIDR range for private subnet"
  type        = list(string)
}

variable "minsize" {
  description = "The minimum no of nodes required"
  type        = number
}

variable "dessize" {
  description = "The desired no of nodes required"
  type        = number
}

variable "maxsize" {
  description = "The maximum number of nodes required"
  type        = number
}

variable "inst_type" {
  description = "The tier of worker node"
  type        = list(string)
}