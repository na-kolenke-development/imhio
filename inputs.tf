variable "ssh-key" {
  type = string
  description = "Public key for SSH connect availability. This needed for Ansible run"
}

variable "ansible-node-cidr" {
  type = string
  description = "Will use in SSH security group. This needed for Ansible run"
}

variable "ami-id" {
  type = string
  description = "AMI for the instance launch (I've no AWS console:)). You could refer to https://wiki.centos.org/Cloud/AWS" 
}
