data "archive_file" "beta_docker_deployment" {
    type        = "zip"
    source_dir  = "${path.root}/lambda/beta-docker-deployment/source"
    output_path = "${path.root}/lambda/beta-docker-deployment/beta-docker-deployment.zip"
}

# beta-docker-deployment
#
resource "aws_lambda_function" "beta_docker_deployment" {
    filename         = data.archive_file.beta_docker_deployment.output_path
    source_code_hash = data.archive_file.beta_docker_deployment.output_base64sha256

    function_name = "beta_docker_deployment"
    role          = var.beta_docker_deployment_role_arn

    layers = var.layers

    handler = "beta-docker-deployment.beta_docker_deployment"
    runtime = "python3.11"

    memory_size = 512
    timeout     = 300

    ephemeral_storage {
        size = 512
    }

    vpc_config {
        subnet_ids         = var.subnet_ids
        security_group_ids = var.security_group_ids
    }

    tags = merge(var.tags, {
        Role            = "serverless"
        ApplicationType = "python"
        CreatedBy       = "devops@nationalarchives.gov.uk"
        Service         = "beta-docker-deployment"
        Name            = "beta_docker_deployment"
    })
}

# using this option allows setting of log retention and removal of the log group
# when the function is destroyed
resource "aws_cloudwatch_log_group" "beta_docker_deployment" {
    name              = "/aws/lambda/${aws_lambda_function.beta_docker_deployment.function_name}"
    retention_in_days = 7
}
