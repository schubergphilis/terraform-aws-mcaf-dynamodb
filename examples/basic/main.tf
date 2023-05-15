provider "aws" {
  region = "eu-west-1"
}

module "table" {
  source = "../.."

  name                           = "example"
  hash_key                       = "pk"
  range_key                      = "sk"
  point_in_time_recovery_enabled = true

  attributes = [
    {
      name = "pk"
      type = "S"
    },
    {
      name = "sk"
      type = "S"
    },
    {
      name = "one_field#two_field#three_field"
      type = "S"
    }
  ]

  global_secondary_indexes = [
    {
      name            = "one_field-two_field-three_field"
      hash_key        = "pk"
      range_key       = "one_field#two_field#three_field"
      projection_type = "ALL"
    }
  ]

}
