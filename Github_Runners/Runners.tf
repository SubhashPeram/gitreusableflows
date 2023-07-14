data "aws_availability_zones" "all_azs" {
  state = "available"
}

data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-ebs"]
  }
}

/*
resource "aws_launch_template" "ec2_launch_template" {
  name        = "github_runner_launch_template"
  description = "Launch Template for GitHub Runners EC2 AutoScaling Group"

  image_id      = data.aws_ami.amazon-linux.id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "github_runner"
  }
}

resource "aws_autoscaling_group" "github_runners_autoscaling_group" {
  name                      = "github_runners_autoscaling_group"
  availability_zones        = data.aws_availability_zones.all_azs.names
  health_check_type         = "EC2"
  health_check_grace_period = var.health_check_grace_period
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }
}

*/