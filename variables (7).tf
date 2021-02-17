// aws_eks_cluster

variable "create_eks_cluster" {
  description = "Hwther want to create eks cluster or not."
  type        = bool
  default     = true
}

variable "eks_cluster_name" {
  description = " Name of the cluster."
  type        = string
  default     = "tapestry"
}

variable "eks_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf."
  type        = string
  default     = ""
}

variable "eks_subnet_ids" {
  description = "List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
  type        = list(string)
  default     = []
}

variable "eks_security_group_ids" {
  description = "List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane."
  type        = list(string)
  default     = null
}

variable "eks_public_access_cidrs" {
  description = "List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled. EKS defaults this to a list with 0.0.0.0/0."
  type        = list(string)
  default     = []
}

variable "eks_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. Default is true."
  type        = bool
  default     = true
}

variable "eks_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
  default     = false
}

variable "eks_enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable."
  type        = list(string)
  default     = null
}

variable "eks_encryption_config" {
  description = "Configuration block with encryption configuration for the cluster."
  type        = any
  default     = []
}

variable "eks_kubernetes_network_config" {
  description = "Configuration block with kubernetes network configuration for the cluster. "
  type        = any
  default     = []
}

variable "eks_tags" {
  description = " Key-value map of resource tags."
  type        = map(any)
  default     = {}
}

variable "eks_version" {
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS."
  type        = string
  default     = null
}

// aws_eks_fargate_profile

variable "create_eks_fargate_profile" {
  description = "Whther want to create eks_fargate_profile or not."
  type        = bool
  default     = true
}

variable "eks_fargate_profile_name" {
  description = " Name of the EKS Fargate Profile."
  type        = string
  default     = "tapestry"
}

variable "eks_pod_execution_role_arn" {
  description = " Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Fargate Profile."
  type        = string
  default     = "arn:aws:iam::940154213284:role/EKScluster"
}

variable "eks_fargate_profile_subnet_ids" {
  description = "dentifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."
  type        = list(string)
  default     = ["subnet-d62ae089", "subnet-2741c229"]
}

variable "eks_selector_namespace" {
  description = " Kubernetes namespace for selection."
  type        = string
  default     = "tapestry"
}

variable "eks_fargate_profile_name_labels" {
  description = " Key-value map of Kubernetes labels for selection."
  type        = map(any)
  default     = {}
}

// aws_eks_node_group
variable "create_eks_node_grp" {
  description = "Whther want to create eks_node_group or not."
  type        = bool
  default     = true
}

variable "eks_node_grp_name" {
  description = "Name of the EKS Node Group."
  type        = string
  default     = "tapestry"
}

variable "eks_node_role_arn" {
  description = "Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group."
  type        = string
  default     = "arn:aws:iam::940154213284:role/EKScluster"
}

variable "eks_node_grp_subnets_id" {
  description = " Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."
  type        = list(string)
  default     = ["subnet-d62ae089", "subnet-2741c229"]
}

variable "eks_node_grp_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "eks_node_grp_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 1
}

variable "eks_node_grp_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "eks_node_grp_ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64"
  type        = string
  default     = "AL2_x86_64"
}

variable "eks_node_grp_capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "eks_node_grp_disk_size" {
  description = " Disk size in GiB for worker nodes. "
  type        = number
  default     = "20"
}

variable "eks_node_grp_force_update_version" {
  description = " Force version update if existing pods are unable to be drained due to a pod disruption budget issue."
  type        = string
  default     = null
}

variable "eks_node_grp_instance_types" {
  description = "List of instance types associated with the EKS Node Group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_node_grp_labels" {
  description = "Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed."
  type        = map(any)
  default     = null
}

variable "eks_node_grp_release_version" {
  description = " AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version."
  type        = string
  default     = null
}

variable "eks_node_grp_version" {
  description = "ubernetes version. Defaults to EKS Cluster Kubernetes version. Terraform will only perform drift detection if a configuration value is provided."
  type        = string
  default     = null
}

variable "eks_ues_launch_template" {
  description = "Whether eks use launch template or not. "
  type        = bool
  default     = false
}

variable "eks_launch_template_id" {
  description = "Identifier of the EC2 Launch Template."
  type        = string
  default     = ""
}

variable "eks_launch_template_name" {
  description = "Name of the EC2 Launch Template."
  type        = string
  default     = ""
}

variable "eks_launch_template_version" {
  description = "EC2 Launch Template version number. While the API accepts values like $Default and $Latest, the API will convert the value to the associated version number (e.g. 1) on read and Terraform will show a difference on next plan. Using the default_version or latest_version attribute of the aws_launch_template resource or data source is recommended for this argument."
  type        = string
  default     = "$Latest"
}

variable "eks_enable_worker_remote_access" {
  description = "Whether eks enable worker remote access or not."
  type        = bool
  default     = false
}

variable "eks_worker_ec2_ssh_key" {
  description = "EC2 Key Pair name that provides access for SSH communication with the worker nodes in the EKS Node Group."
  type        = string
  default     = ""
}

variable "eks_worker_source_security_grp" {
  description = " Set of EC2 Security Group IDs to allow SSH access (port 22) from on the worker nodes. "
  type        = list(string)
  default     = null
}