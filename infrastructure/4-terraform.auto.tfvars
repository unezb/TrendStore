region = "us-east-1"
name_prefix = "trendstore"

inst_type = ["t3.medium"]
minsize = 2
maxsize = 3
dessize = 2

vpc_cidr = "10.0.0.0/16"
pub_sub  = ["10.0.101.0/24", "10.0.102.0/24"]
priv_sub = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_az = [ "us-east-1a", "us-east-1b" ]