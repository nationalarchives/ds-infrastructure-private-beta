# networking
#
data "aws_ssm_parameter" "vpc_id" {
    name = "/infrastructure/network/base/vpc_id"
}

data "aws_ssm_parameter" "vpc_cidr" {
    name = "/infrastructure/network/base/vpc_cidr"
}

data "aws_ssm_parameter" "public_subnet_2a_cidr" {
    name = "/infrastructure/network/base/public_subnet_2a_cidr"
}

data "aws_ssm_parameter" "public_subnet_2b_cidr" {
    name = "/infrastructure/network/base/public_subnet_2b_cidr"
}

data "aws_ssm_parameter" "private_subnet_2a_id" {
    name = "/infrastructure/network/base/private_subnet_2a_id"
}

data "aws_ssm_parameter" "private_subnet_2a_cidr" {
    name = "/infrastructure/network/base/private_subnet_2a_cidr"
}

data "aws_ssm_parameter" "private_subnet_2b_id" {
    name = "/infrastructure/network/base/private_subnet_2b_id"
}

data "aws_ssm_parameter" "private_subnet_2b_cidr" {
    name = "/infrastructure/network/base/private_subnet_2b_cidr"
}

data "aws_ssm_parameter" "private_db_subnet_2a_id" {
    name = "/infrastructure/network/base/private_db_subnet_2a_id"
}

data "aws_ssm_parameter" "private_db_subnet_2a_cidr" {
    name = "/infrastructure/network/base/private_db_subnet_2a_cidr"
}

data "aws_ssm_parameter" "private_db_subnet_2b_id" {
    name = "/infrastructure/network/base/private_db_subnet_2b_id"
}

data "aws_ssm_parameter" "private_db_subnet_2b_cidr" {
    name = "/infrastructure/network/base/private_db_subnet_2b_cidr"
}

data "aws_ssm_parameter" "client_vpc_cidr" {
    name = "/infrastructure/client_vpc_cidr"
}

# amis
#
data "aws_ami" "private_beta_rp_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = [
            "private-beta-rp-primer*"
        ]
    }

    filter {
        name   = "virtualization-type"
        values = [
            "hvm"
        ]
    }

    owners = [
        data.aws_caller_identity.current.account_id,
        "amazon"
    ]
}

data "aws_ami" "private_beta_dw_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = [
            "docker-general-primer*"
        ]
    }

    filter {
        name   = "virtualization-type"
        values = [
            "hvm"
        ]
    }

    owners = [
        data.aws_caller_identity.current.account_id,
        "amazon"
    ]
}

data "aws_ami" "private_beta_postgres_source_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = [
            "private-beta-postgres-primer*"
        ]
    }

    filter {
        name   = "virtualization-type"
        values = [
            "hvm"
        ]
    }

    owners = [
        data.aws_caller_identity.current.account_id,
        "amazon"
    ]
}

#data "aws_ami" "private_beta_postgres_source_ami" {
#    most_recent = true
#
#    filter {
#        name   = "name"
#        values = [
#            "private-beta-postgres-source-primer*"
#        ]
#    }
#
#    filter {
#        name   = "virtualization-type"
#        values = [
#            "hvm"
#        ]
#    }
#
#    owners = [
#        data.aws_caller_identity.current.account_id,
#        "amazon"
#    ]
#}

#data "aws_ami" "private_beta_postgres_replica_ami" {
#    most_recent = true
#
#    filter {
#        name   = "name"
#        values = [
#            "private-beta-postgres-replica-primer*"
#        ]
#    }
#
#    filter {
#        name   = "virtualization-type"
#        values = [
#            "hvm"
#        ]
#    }
#
#    owners = [
#        data.aws_caller_identity.current.account_id,
#        "amazon"
#    ]
#}

data "aws_caller_identity" "current" {}

data "aws_ssm_parameter" "zone_id" {
    name = "/infrastructure/zone_id"
}

#data "aws_secretsmanager_secret_version" "wp" {
#    secret_id = data.aws_secretsmanager_secret.wp.id
#}

data "aws_ssm_parameter" "sns_slack_alert" {
    name = "/infrastructure/sns_slack_alert_arn"
}

# certificates
#
data "aws_ssm_parameter" "wildcard_certificate_arn" {
    name = "/infrastructure/certificate-manager/wildcard-certificate-arn"
}

data "aws_ssm_parameter" "us_east_1_wildcard_certificate_arn" {
    name = "/infrastructure/certificate-manager/us-east-1-wildcard-certificate-arn"
}

# DB Security Group
#
data "aws_ssm_parameter" "web_db_sg_id" {
    name = "/infrastructure/web_db_sg_id"
}

# codedeploy
# ----------------
data "aws_ssm_parameter" "s3_deployment_source_arn" {
    name = "/infrastructure/s3/deployment_source_arn"
}

# cloudfront
#
data "aws_ssm_parameter" "cf_waf_ip_set" {
    name = "/application/private_beta/waf/ip_set"
}
