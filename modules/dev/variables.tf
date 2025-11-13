variable "ami"{}
variable "instance_type" {}
variable "subnet_id" {}
variable "key" {}
variable "vpc_id" {}
variable "cidr_blocks" {}
variable "tags" {
  type = map(string)
}
variable sgname {
    sensitive = true
}