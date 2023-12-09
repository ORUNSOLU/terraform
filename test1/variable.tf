variable "instance_count" {
  description = "EC2 instance count"
  type = number
  default = 2
}

variable "user_names" {
  description = "create default user-names"
  type = list(string)
  default = [ "user1", "user2", "user3" ]
}