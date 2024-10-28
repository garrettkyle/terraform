provider "aws" {
  region = var.aws_region
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_security_group" "main" {
  description = "Lambda Function Access"
  name        = var.security_group_name
  vpc_id      = var.vpc_identifier
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "main" {
  name               = var.lambda_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.main.json
}

resource "aws_iam_policy" "s3" {
  name        = "${var.lambda_artifact_s3_bucket_name}_access"
  description = "Policy to allow access to S3 bucket ${var.lambda_artifact_s3_bucket_name}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.lambda_artifact_s3_bucket_name}",
          "arn:aws:s3:::${var.lambda_artifact_s3_bucket_name}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.s3.arn
}

resource "aws_iam_policy" "lambda" {
  name        = "lambda_function_misc"
  description = "Misc permissions Lambda needs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeSubnets",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeVpcs"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "main" {
  description   = var.lambda_function_description
  function_name = var.lambda_function_name
  handler       = "index.py"
  role          = aws_iam_role.main.arn
  runtime       = "python3.9"
  s3_bucket     = var.lambda_artifact_s3_bucket_name
  s3_key        = var.lambda_artifact_s3_bucket_key
  timeout       = var.lambda_function_timeout_seconds
  vpc_config {
    subnet_ids         = [var.subnet_id]
    security_group_ids = [aws_security_group.main.id]
  }
}