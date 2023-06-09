output "dw_profile_name" {
    value = aws_iam_instance_profile.dw_profile.name
}
output "dw_efs_backup_arn" {
    value = aws_iam_role.dw_efs_backup.arn
}
output "dw_efs_id" {
    value = aws_iam_role.dw_role.id
}
output "rp_efs_backup_arn" {
    value = aws_iam_role.rp_efs_backup.arn
}
output "rp_role_id" {
    value = aws_iam_role.rp_role.arn
}
output "rp_profile_name" {
    value = aws_iam_instance_profile.rp_profile.name
}
