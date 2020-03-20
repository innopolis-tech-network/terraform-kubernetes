variable "name" {
  description = "Name of a specific Kubernetes cluster."

  type = string

  default = null
}

variable "description" {
  description = "A description of the Kubernetes cluster."

  type = string

  default = null
}

variable "folder_id" {
  description = "The ID of the folder that the Kubernetes cluster belongs to."

  type = string
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the Kubernetes cluster."

  type = map(string)

  default = {}
}

variable "network_id" {
  description = "The ID of the cluster network."

  type = string
}

variable "cluster_ipv4_range" {
  description = <<EOF
CIDR block. IP range for allocating pod addresses. It should not overlap with
any subnet in the network the Kubernetes cluster located in. Static routes will
be set up for this CIDR blocks in node subnets.
EOF

  type = string

  default = null
}

variable "service_ipv4_range" {
  description = <<EOF
CIDR block. IP range Kubernetes service Kubernetes cluster IP addresses
will be allocated from. It should not overlap with any subnet in the network
the Kubernetes cluster located in.
EOF

  type = string

  default = null
}

variable "service_account_name" {
  description = <<EOF
Name of service account to be used for provisioning Compute Cloud
and VPC resources for Kubernetes cluster.
EOF

  type = string
}

variable "node_service_account_name" {
  description = <<EOF
Name of service account to be used by the worker nodes of the Kubernetes cluster
to access Container Registry or to push node logs and metrics. If ommited or
equal to service_account_name, service account will be used as node service account.
EOF

  default = null
}

variable "release_channel" {
  description = "Cluster release channel."

  type = string

  default = "STABLE"
}

variable "master_version" {
  description = "Version of Kubernetes that will be used for master."

  type = string

  default = null
}

variable "master_public_ip" {
  description = "Boolean flag. When true, Kubernetes master will have visible ipv4 address."

  type = bool

  default = true
}

variable "master_region" {
  description = <<EOF
Name of region where cluster will be created. Required for regional cluster,
not used for zonal cluster.
EOF

  type = string

  default = null
}

variable "master_zones" {
  description = <<EOF
List of zones where cluster will be created. If list contains only one zone,
will be created zonal cluster, if more than one -- regional.
EOF

  type = list(object({
    zone = string
    id   = string
  }))
}

variable "node_groups" {
  default = {}
}