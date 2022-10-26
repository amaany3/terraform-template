variable "gcp" {
  type = object({
    project  = string
    region   = string
    location = string
  })
}
