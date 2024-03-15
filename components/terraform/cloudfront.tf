variable "cf_dist" {}

## -----------------------------------------------------------------------------
##modules

module "cloudfront_public" {
    source = "./cloudfront"

    cf_dist = var.cf_dist

    lb_dns_name = module.reverse-proxy.rp_lb_dns_name

    private_beta_waf_info         = module.waf.private_beta_waf_info
    wildcard_certificate_arn = data.aws_ssm_parameter.us_east_1_wildcard_certificate_arn.value

    custom_header_name = jsondecode(data.aws_secretsmanager_secret_version.etna_custom_header.secret_string)["header_name"]
    custom_header_value = jsondecode(data.aws_secretsmanager_secret_version.etna_custom_header.secret_string)["header_value"]

    tags = merge(local.tags, {
        service = "private-beta-cloudfront"
    })
}
