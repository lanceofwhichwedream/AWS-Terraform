variable "image_id" {
  description = "Image ID to use in the Launch Template"
  type        = string
  default     = "ami-0bc691261a82b32bc"
}

variable "instance_type" {
  description = "What Type of instance to use in the Launch Template"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum Capacity for the instances in the autoscaler group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum Capacity for the instances in the autoscaler group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity for the Instances in the autoscaler group"
  type        = number
  default     = 2
}