



resource "aws_s3_bucket" "s3_for_logs" {
    bucket = "cloud-trail-logg-ssss"
    acl = "private"

    lifecycle_rule {
        id = "remove_old_logs"
        enabled = true

        prefix = "AWSLogs/${data.aws_caller_identity.current.account_id}/CloudTrail/"

        expiration {
            days = 30
        }
    }
}

