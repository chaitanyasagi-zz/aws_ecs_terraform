#This IAM trust relationship policy allows containers in your Amazon ECS tasks to make calls to the AWS APIs on your behalf. 

resource "aws_iam_role" "ecs_task_assume_role" {
  name               = "ecs_task_assume_role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_policy.json
}

data "aws_iam_policy_document" "ecs_task_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

