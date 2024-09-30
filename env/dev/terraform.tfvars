project_name = "linuxtips-ecs-cluster"
region       = "us-east-1"


### SSM PARAMETERS ###

ssm_vpc_id           = "/linuxtips-vpc/vpc/vpc_id"
ssm_public_subnet_1  = "/linuxtips-vpc/vpc/subnet_public_1a"
ssm_public_subnet_2  = "/linuxtips-vpc/vpc/subnet_public_1b"
ssm_public_subnet_3  = "/linuxtips-vpc/vpc/subnet_public_1c"
ssm_private_subnet_1 = "/linuxtips-vpc/vpc/subnet_private_1a"
ssm_private_subnet_2 = "/linuxtips-vpc/vpc/subnet_private_1b"
ssm_private_subnet_3 = "/linuxtips-vpc/vpc/subnet_private_1c"


### LB ###
load_balancer_internal = false
load_balancer_type     = "application"


### ECS GENERAL ###

nodes_ami = "ami-07ae7190a74b334a0"

node_intance_type = "t3a.large"

node_volume_size = "50"

node_volume_type = "gp3"

cluster_on_demand_min_size="2"

cluster_on_demand_max_size="4"

cluster_on_demand_desired_size="3"

cluster_spot_min_size="2"

cluster_spot__max_size="4"

cluster_spot__desired_size="3"