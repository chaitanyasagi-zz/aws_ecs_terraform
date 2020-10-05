resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/nginx-container"
  tags = {
    "env"       = "test"
    "createdBy" = "v c v sagi"
  }
}