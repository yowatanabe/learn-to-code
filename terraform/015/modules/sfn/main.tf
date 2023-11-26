resource "aws_iam_role" "test" {
  name = "sfn-test-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "test" {
  name = "sfn-test-policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "lambda:InvokeFunction"
          ],
          "Effect" : "Allow",
          "Resource" : "${var.lambda_function_arn}"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "test" {
  policy_arn = aws_iam_policy.test.arn
  role       = aws_iam_role.test.name
}

resource "aws_sfn_state_machine" "test" {
  name     = "test_state_machine"
  role_arn = aws_iam_role.test.arn

  definition = <<EOF
{
  "Comment": "A simple AWS Step Functions state machine",
  "StartAt": "LambdaState",
  "States": {
    "LambdaState": {
      "Type": "Task",
      "Resource": "${var.lambda_function_arn}",
      "End": true
    }
  }
}
EOF
}
