module "instance_provisioning" {
  source         = "../module"
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = var.subnet_id
  key            = var.key
  vpc_id         = var.vpc_id
  cidr_blocks    = var.cidr_blocks
  sgname         = var.sgname
  tags           = var.tags
}