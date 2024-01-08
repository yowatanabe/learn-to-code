variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "rds_instance_class" {
  type    = string
  default = "db.t2.micro"
}
