# mcaf-terraform-aws-dynamodb

This module creates a DynamoDB Table with options for Auto-scaling.

```terraform
module "dynamodb_table" {
  source = "../../"

  name           = "NightNurseDetections"
  hash_key       = "FullCameraName"
  range_key      = "DateTime"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20

 [...]

# using auto-scaling
  autoscaling_read = {
    scale_in_cooldown  = 60
    scale_out_cooldown = 0
    target_value       = 70
    max_capacity       = 100
    min_capacity       = 5
  }

 [...]
}

# Or a disabled table
module "disabled_dynamodb_table" {
  source = "../../"

  create_table = false
}
```
