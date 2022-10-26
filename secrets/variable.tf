variable "gcp" {
  type = object({
    project  = string
    region   = string
    location = string
  })
}

variable "environment" {
  type = string
}

variable "data_bucket" {
  type = string
}
