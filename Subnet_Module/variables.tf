variable "resource_group_name" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "subnets" {
  type = map(string)
}