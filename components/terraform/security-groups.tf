module "sgs" {
    source = "./security-groups"

    vpc_id = data.aws_ssm_parameter.vpc_id.value

    rp_lb_cidr = [
        data.aws_ssm_parameter.public_subnet_2a_id.value,
        data.aws_ssm_parameter.public_subnet_2b_id.value,
    ]

    rp_instance_cidr = [
        data.aws_ssm_parameter.private_subnet_2a_id.value,
        data.aws_ssm_parameter.private_subnet_2b_id.value,
        data.aws_ssm_parameter.client_vpc_cidr.value,
    ]

    dw_lb_cidr = [
        data.aws_ssm_parameter.private_subnet_2a_id.value,
        data.aws_ssm_parameter.private_subnet_2b_id.value,
        data.aws_ssm_parameter.client_vpc_cidr.value,
    ]

    dw_instance_cidr = [
        data.aws_ssm_parameter.private_subnet_2a_id.value,
        data.aws_ssm_parameter.private_subnet_2b_id.value,
        data.aws_ssm_parameter.client_vpc_cidr.value,
    ]

    tags = local.tags
}
