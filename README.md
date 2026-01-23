# terraform-aws-mcaf-dynamodb

Terraform module to create an AWS DynamoDB Table.

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_contributor_insights.table_insight](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_contributor_insights) | resource |
| [aws_dynamodb_table.table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | List of attribute definitions for keys and indexes. Each item must include: `name` and `type` (S, N, or B). | `list(map(string))` | n/a | yes |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Billing mode for the table. Valid values: PROVISIONED or PAY\_PER\_REQUEST. | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Enable deletion protection for the table. | `bool` | `true` | no |
| <a name="input_enable_dynamodb_insights"></a> [enable\_dynamodb\_insights](#input\_enable\_dynamodb\_insights) | Enable DynamoDB Contributor Insights for the table. | `bool` | `false` | no |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | Global secondary indexes (GSIs). Subject to DynamoDB limits on number of GSIs and projected attributes. | <pre>list(object({<br/>    name               = string<br/>    hash_key           = string<br/>    projection_type    = string<br/>    range_key          = optional(string, null)<br/>    read_capacity      = optional(string, null)<br/>    write_capacity     = optional(string, null)<br/>    non_key_attributes = optional(list(string), null)<br/>  }))</pre> | `[]` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | Partition (hash) key attribute name. Must also be defined in `attributes`. | `string` | n/a | yes |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS key ARN used for server-side encryption. If `null`, the AWS-managed key `aws/dynamodb` is used. | `string` | n/a | yes |
| <a name="input_local_secondary_indexes"></a> [local\_secondary\_indexes](#input\_local\_secondary\_indexes) | Local secondary indexes (LSIs). LSIs can only be set at table creation time. | <pre>list(object({<br/>    name               = string<br/>    range_key          = string<br/>    projection_type    = string<br/>    non_key_attributes = optional(list(string), null)<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the DynamoDB table. | `string` | n/a | yes |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | Enable point-in-time recovery (PITR) for the table. | `bool` | `true` | no |
| <a name="input_range_key"></a> [range\_key](#input\_range\_key) | Sort (range) key attribute name. Must also be defined in `attributes`. | `string` | `null` | no |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | Read capacity units (RCU) when `billing_mode` is `PROVISIONED`. | `number` | `null` | no |
| <a name="input_replica_regions"></a> [replica\_regions](#input\_replica\_regions) | Replica regions configuration for global tables. | <pre>list(object({<br/>    region_name            = string<br/>    kms_key_arn            = optional(string, null)<br/>    propagate_tags         = optional(bool, null)<br/>    point_in_time_recovery = optional(bool, null)<br/>  }))</pre> | `[]` | no |
| <a name="input_stream_enabled"></a> [stream\_enabled](#input\_stream\_enabled) | Enable DynamoDB Streams for the table. | `bool` | `false` | no |
| <a name="input_stream_view_type"></a> [stream\_view\_type](#input\_stream\_view\_type) | Stream view type when streams are enabled. Valid values: `KEYS_ONLY`, `NEW_IMAGE`, `OLD_IMAGE`, `NEW_AND_OLD_IMAGES`. | `string` | `null` | no |
| <a name="input_table_class"></a> [table\_class](#input\_table\_class) | Table class. Valid values: `STANDARD` or `STANDARD_INFREQUENT_ACCESS`. | `string` | `"STANDARD"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_ttl_attribute_name"></a> [ttl\_attribute\_name](#input\_ttl\_attribute\_name) | TTL attribute name (Unix epoch time in seconds). Used only when `ttl_enabled` is true. | `string` | `""` | no |
| <a name="input_ttl_enabled"></a> [ttl\_enabled](#input\_ttl\_enabled) | Enable Time To Live (TTL) on the table. | `bool` | `false` | no |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | Write capacity units (WCU) when `billing_mode` is `PROVISIONED`. | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the DynamoDB table. |
| <a name="output_id"></a> [id](#output\_id) | ID of the DynamoDB table. |
| <a name="output_name"></a> [name](#output\_name) | Name of the DynamoDB table. |
| <a name="output_stream_arn"></a> [stream\_arn](#output\_stream\_arn) | ARN of the DynamoDB table stream (empty if streams are disabled). |
| <a name="output_stream_label"></a> [stream\_label](#output\_stream\_label) | Timestamp label of the DynamoDB table stream (empty if streams are disabled). |
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0. See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-dynamodb/blob/master/LICENSE) for full details.
