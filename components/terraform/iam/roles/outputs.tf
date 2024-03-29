output "dw_profile_name" {
    value = aws_iam_instance_profile.dw_profile.name
}
output "dw_profile_arn" {
    value = aws_iam_instance_profile.dw_profile.arn
}
output "rp_profile_name" {
    value = aws_iam_instance_profile.rp_profile.name
}
output "rp_profile_arn" {
    value = aws_iam_instance_profile.rp_profile.arn
}

output "media_efs_backup_arn" {
    value = aws_iam_role.media_efs_backup.arn
}

output "dw_role_id" {
    value = aws_iam_role.dw_role.id
}
output "rp_role_id" {
    value = aws_iam_role.rp_role.arn
}
output "lambda_beta_docker_deployment_role_arn" {
    value = aws_iam_role.lambda_beta_docker_deployment_role.arn
}
