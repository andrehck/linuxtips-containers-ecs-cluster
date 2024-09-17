resource "aws_autoscaling_group" "on_demand" {
  name_prefix = format("%s-on-demand", var.project_name)
  vpc_zone_identifier = [
    data.aws_ssm_parameter.ssm_private_subnet_1a,
    data.aws_ssm_parameter.ssm_private_subnet_1b,
    data.aws_ssm_parameter.ssm_private_subnet_1c
  ]

  desired_capacity = var.cluster_on_demand_desired_size
  max_size         = var.cluster_on_demand_max_size
  min_size         = var.cluster_on_demand_min_size


  launch_template {
    id      = aws_launch_template.on_demand.id
    version = aws_launch_template.on_demand.latest_version
  }


  tag {
    key                 = "Name"
    value               = format("%s-on-demand", var.project_name)
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonEcsManaged"
    value               = true
    propagate_at_launch = true
  }
}


resource "aws_ecs_capacity_provider" "on_demand" {
  name = format("%s-on-demand", var.project_name)

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.on_demand.arn
        managed_scaling {
          maximum_scaling_step_size = 10
          minimum_scaling_step_size = 1
          status = "ENABLED"
          target_capacity = 90
        }
  }
}