variable "ENVIRONMENT_IDENTIFIER" {
  default     = "mgs"
  description = "customer, system or data hub identifier. This value makes created resource names unique (f.ex storage account) and is REQUIRED to be changed per deployment"
}
variable "ENVIRONMENT_TYPE" {
  description = "environtment type (dev/test/prod)"
  default     = "dev"
}
variable "rgname" {
  type = string
  default = "RGmultistage"
  
}