<!-- VSCode Markdown Exclusions-->
<!-- markdownlint-disable MD025 Single Title Headers-->
# Tapestry AWS Elastic container services (ECS) Terraform Module

## Examples

### basic
```hcl
module "ecs" {
  source                     = "git@github.com:tapestryinc/aws_ecs?ref=v1.0.0"
  aws_ecs_capacity_provider  = true
  ecs_capacity_provider_name = "tapestry"
  ecs_auto_scalling_grp_arn  = "arn:aws:autoscaling:region:123456789012:autoScalingGroup:uuid:autoScalingGroupName/asg-name"
  managed_scaling = [{
    maximum_scaling_step_size = 1
    minimum_scaling_step_size = 1
    status                    = "ENABLED"
    target_capacity           = 2
  }]
  create_cluster = true
  cluster_name   = "tapestry"
  family_name    = "tapestry_family"

  container_definitions_json = <<EOF
  [
      {
        "name": "nginx",
        "image": "nginx",
        "cpu": 10,
        "memory": 128,
        "essential": true,
        "portMappings": [
          {
            "containerPort": 80,
            "hostPort": 80
          }
        ]
      }
  ]
  EOF

  ecs_service_name              = "tapestry_service_name"
  tasks_desired_count           = 1
  tasks_maximum_percent         = 100
  tasks_minimum_healthy_percent = 1

}
```

## Dependencies
### primary
  * [terraform](https://www.terraform.io/)

### nice to have
  * [terraform for vsc](https://github.com/mauve/vscode-terraform)
  * [terraform-config-inspect](https://github.com/hashicorp/terraform-config-inspect)

## Provider Requirements
## Providers

| Name | Version |
|------|---------|
| aws | 3.26.0 |
| terraform | 0.12 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create\_eks\_cluster | Hwther want to create eks cluster or not.| `bool` | `true` |  |
| eks\_cluster\_name | Name of the cluster.| `string` | "tapestry" |  |
| eks\_iam\_role\_arn | The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. | `string` | |  |
| eks\_subnet\_ids | List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane.| `list(string)` | [] |  |
| eks\_security\_group\_ids | List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane.|`list(string)`| `null` |  |
| eks\_public\_access\_cidrs| List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled. EKS defaults this to a list with 0.0.0.0/0.| `list(string)` | [] |  |
| eks\_endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. Default is true.| `bool` | `true` |  |
| eks\_endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` |`false` |  |
| eks\_enabled\_cluster\_log\_types | A list of the desired control plane logging to enable.| `list(string)` | `null` |  |
| eks\_encryption\_config| Configuration block with encryption configuration for the cluster. | `any` | [] |  |
| eks\_kubernetes\_network\_config | Configuration block with kubernetes network configuration for the cluster. | `any` | [] | |
| eks\_tags | Key-value map of resource tags. | `map(any)` | {} | | 
| eks\_version| Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. | `string` | `null` | |
| create\_eks\_fargate\_profile | Whther want to create eks_fargate_profile or not. | `bool` |`true'|  |
| eks\_fargate\_profile\_name| Name of the EKS Fargate Profile. | `string` | `"tapestry"` | |
| eks\_pod\_execution\_role\_arn| Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Fargate Profile.| `string` | `"arn:aws:iam::940154213284:role/EKScluster"`|  |
| eks\_fargate\_profile\_subnet\_ids | dentifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster).|`list(string)` | `["subnet-d62ae089", "subnet-2741c229"]`||
| eks\_selector\_namespace | Kubernetes namespace for selection. | `string` | `"tapestry"` |  |
| eks\_fargate\_profile\_name\_labels | Key-value map of Kubernetes labels for selection. | `map(any)` | {} | |
| create\_eks\_node\_grp| Whther want to create eks_node_group or not.| `bool` | `true` |  |
| eks\_node\_grp\_name | Name of the EKS Node Group.| `string` | `"tapestry"` | |
| eks\_node\_role\_arn | Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group. | `string` | `"arn:aws:iam::940154213284:role/EKScluster"
` | |
| eks\_node\_grp\_subnets\_id| Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster). | `list(string)` |`["subnet-d62ae089", "subnet-2741c229"]`  |   |
| eks\_node\_grp\_desired\_size | Desired number of worker nodes. | `number` | `2` | |
| eks\_node\_grp\_max\_size| Maximum number of worker nodes. | `number` | `1` | |
| eks\_node\_grp\_min\_size |Minimum number of worker nodes. | `number` | `1` |   |
| eks\_node\_grp\_ami\_type | Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64 | `string` | `"AL2_x86_64"` |  |
| eks\_node\_grp\_capacity\_type | Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT | `string` | `"ON_DEMAND"` |  |
| eks\_node\_grp\_disk\_size | Disk size in GiB for worker nodes.  | `number` | `"20"` |   |
| eks\_node\_grp\_force\_update\_version| Force version update if existing pods are unable to be drained due to a pod disruption budget issue.| `string`| `null` |  |
| eks\_node\_grp\_instance\_types| List of instance types associated with the EKS Node Group.| `list(string)` | `["t3.medium"]` |  |
| eks\_node\_grp\_labels| Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed. | `map(any)` | `null` |  |
| eks\_node\_grp\_release\_version| AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version.| `string` | `null` |  |
| eks\_node\_grp\_version | ubernetes version. Defaults to EKS Cluster Kubernetes version. Terraform will only perform drift detection if a configuration value is provided.| `string` | `null`|  |
| eks\_ues\_launch\_template | Whether eks use launch template or not.  | `bool` | `false` |  |
| eks\_launch\_template\_id| Identifier of the EC2 Launch Template. | `string` | "" |  |
| eks\_launch\_template\_name | Name of the EC2 Launch Template.| `string` | "" |  |
| eks\_launch\_template\_version|EC2 Launch Template version number. While the API accepts values like $Default and $Latest, the API will convert the value to the associated version number (e.g. 1) on read and Terraform will show a difference on next plan. Using the default_version or latest_version attribute of the aws_launch_template resource or data source is recommended for this argument. | `string` | `"$Latest"`  | |
| eks\_enable\_worker\_remote\_access| Whether eks enable worker remote access or not. | `bool` | `false` |  |
| eks\_worker\_ec2\_ssh\_key| EC2 Key Pair name that provides access for SSH communication with the worker nodes in the EKS Node Group.| `string` | "" |  |
| eks\_worker\_source\_security\_grp| Set of EC2 Security Group IDs to allow SSH access (port 22) from on the worker nodes.  | `list(string)` | `null` |  |
## Outputs

| Name | Description |
|------|-------------|
| cluster\_arn| The Amazon Resource Name (ARN) that identifies the cluster | 
| capacity\_provider\_name| Name of the provisioned capacity provider | 
| capacity\_provider\_id| id of capacity provider | 
| capacity\_provider\_arn| The Amazon Resource Name (ARN) that identifies the capacity provider | 
| cluster\_name| Name of cluster|
| cluster\_id| id of cluster | 
| ecs\_service\_name| Name of The service |
| ecs\_service\_id| id of ecs service | 
|  ecs\_service\_iam\_role| The ARN of IAM role used for ELB | 
| ecs\_service\_cluster| The Amazon Resource Name (ARN) of cluster which the service runs on | 
| ecs\_service\_desired\_count| The number of instances of the task definition | 
| aws\_ecs\_task\_definition\_arn| Full ARN of the Task Definition (including both family and revision). | 
| aws\_ecs\_task\_definition\_family| The family of the Task Definition.| 
|aws\_ecs\_task\_definition\_revision| The revision of the task in a particular family. | 
| autoscaling\_group\_arn| aws autoscaling group arn | 
