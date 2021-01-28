
# Module `TF-AWS-ALB-SharedInternal-TargetGroup-Module`
This module wraps a single target group, providing defaults as defined by
policy.

## Examples

### basic
```hcl
module "shared_alb_attach" {
  source = "git@github.com:tapestryinc/TF-AWS-ALB-SharedInternal-TargetGroup-Module.git?ref=v.X.X.X"

  alb_workspace = "dev-us-east-1"
  name          = "myApplicationSharedAttachment"
  port          = 443
  protocol      = "HTTPS"

  host_header  = "my-example.coach.com"
  instance_ids = [module.my_ec2_instance.id, module.my_ec2_instance_2.id]

  tags = module.tags.tags
}
```

## Dependencies
### primary
  * [terraform](https://www.terraform.io/)
  * [git](https://git-scm.com/download/win)

### nice to have
  * [make for vsc](https://github.com/technosophos/vscode-make)
  * [github desktop](https://desktop.github.com/)
  * [terraform for vsc](https://github.com/mauve/vscode-terraform)
  * [terraform-config-inspect](https://github.com/hashicorp/terraform-config-inspect)

## Contributing and Contacts

This project is owned by [Project Team Name](project_name@tapestry.com).

To contribute, please:
  * Fork the project
  * Create a local branch
  * Submit Changes
  * Create A Pull Request

## Provider Requirements
## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| terraform | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| aws\_ecs\_capacity\_provider | Wether you want to have ecs capacity provider resource. | `bool` | `true` |  |
| ecs\_capacity\_provider\_name | ecs capacity provider name. | `string` | `null` |  |
| ecs\_auto\_scalling\_grp\_arn | ARN of autoscalling group. | `string` | `null` |  |
| managed\_termination\_protection | Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens. Valid values are ENABLED and DISABLED. | `string` | `"DISABLED"` |  |
| managed\_scaling | parameters of the auto scaling:(max_scalling_step:The maximum step adjustment size),(min_scalling_step:The maximum step adjustment size),(status:Whether auto scaling is managed by ECS,Valid values are ENABLED and DISABLED),(target_capacity:The target utilization for the capacity provider. A number between 1 and 100.).|`list(any)`| `null` |  |
| capacity\_providers | List of short names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT. | `list(any)` | `[]` |  |
| create\_cluster | Wether you want to have ecs cluster resource. | `bool` | `true` |  |
| ecs\_use\_fargate | If ecs use fargate or not. | `bool` | `false` |  |
| cluster\_name | The service name. | `string` | `` |  |
| aws\_ecs\_task\_definition | Wether you want to have ecs task definition | `bool` | `true` |  |
| container\_definitions\_json | A list of valid container definitions provided as a single valid JSON document. Please note that you should only provide values that are part of the container definition document. | `string` | `` |  |
| ecs\_capacity\_provider | List of short names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT. | `list(string)` | `null` |  |
| default\_capacity\_provider\_strategy | The capacity provider strategy to use by default for the cluster. Can be one or more. | `list(any)` | `null` |  |
| insights\_setting | Configuration block(s) with cluster settings. For example, this can be used to enable CloudWatch Container Insights for a cluster. | `list(any)` | `null` | 
| aws\_ecs\_service| Wether you want to have ecs capacity provider resource. | `bool` | `true` |  |
| ecs\_service\_name | The service name. | `string` | `` |  |
| ecs\_service\_type\_of\_deployment\_controller | Type of deployment controller. Valid values: CODE_DEPLOY, ECS, EXTERNAL. Default: ECS | `string` | `"ECS"`|  |
| tasks\_desired\_count | he number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy.|`number` | `0`|  |
| tasks\_minimum\_healthy\_percent | Lower limit on the number of running tasks. | `number` | `0` |  |
| tasks\_maximum\_percent | Upper limit on the number of running tasks. | `number` | `0` |  |
| enable\_ecs\_managed\_tags | Specifies whether to enable Amazon ECS managed tags for the tasks within the service. | `bool` | `"true"` |  |
| force\_new\_deployment | Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination. | `bool` | `true` |  |
| health\_check\_grace\_period\_seconds | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers. | `number` | `null` |  |
| iam\_role\_arn | ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. | `string` | `` |  |
| platform\_version | The platform version on which to run your service. Only applicable for launch_type set to FARGATE. Defaults to LATEST. | `string` | `"LATEST"` |  |
| propagate\_tags | Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION. | `string` | `null` |  |
| scheduling\_strategy | The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy. | `string` | `"REPLICA"` |  |
| wait\_for\_steady\_state | Terraform will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing. | `bool` | `false` |  |
| ordered\_placement\_strategy | Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. The maximum number of ordered_placement_strategy blocks is 5 | `list(any)` | `[]` |  |
| placement\_constraints | rules that are taken into consideration during task placement. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. Maximum number of placement_constraints is 10. | `list(any)` | `[]` |  |
| capacity\_provider\_strategy | The capacity provider strategy to use by default for the cluster. Can be one or more. | `list(any)` | `[]` |  |
| ecs\_tags | Key-value map of resource tags. | `map(any)` | `{}` |  |
| network\_configuration| The network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes. | `list(any)`| `null` |  |
| load\_balancer | List of load balancer target group objects containing the lb_target_group_arn, container_port and container_health_check_port. The container_port is the port on which the container will receive traffic. The container_health_check_port is an additional port on which the container can receive a health check. The lb_target_group_arn is either Application Load Balancer (ALB) or Network Load Balancer (NLB) target group ARN tasks will register with. | `list(any)` | `[]` |  |
| lb\_type| Load balancer type possible values are Classic or alb or nlb. | `string` | `null` |  |
| target\_container\_name| "The name of the container to associate with the load balancer" | `string` | `"LATEST"` | no |
| service\_registries | List of service registry objects as per https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1. | `list(any)` | `[]` |  |
| family\_name| A unique name for your task definition. | `string` | `` |  |
| task\_definition\_tag| A map of tags to add to ECS task_deffination_tag. | `map(string)` | `{}` |  |
| task\_role\_arn|The AWS IAM role that will be provided to the task to perform AWS actions. | `string` | `` |  |
| task\_network\_mode| The network mode to be used in the task definiton. Supported modes are awsvpc and bridge. | `string' | `"bridge"` |  |
| task\_cpu| CPU value for the task, required for FARGATE. | `string` | `null` |  |
| task\_memory| Memory value for the task, required for FARGATE. | `string` | `null` |  |
| existing\_cluster\_arn| if we need to give existing cluster ARN. | `string` | `null` |  |
| ipc\_mode| The IPC resource namespace to use for the containers in the task. | `` | `null` |  |
| service\_launch\_type| The launch type, can be EC2 or FARGATE. | `string` | `EC2` |  |
| volume| A list of volume definitions in JSON format that containers in your task may use. | `list(any)` | `[]` |  |
| task\_execution\_role\_arn| The role arn used for task execution. Required for network mode awsvpc. | `string` | `null` |  |
| placement\_constraints\_task| A set of placement constraints rules that are taken into consideration during task placement. | `list(any)` | `[]` |  |
| proxy\_configuration|  The proxy configuration details for the App Mesh proxy. This is a list of maps, where each map should contain \"container_name\", \"properties\" and \"type\". | `list(any)` | `[]` | no |
| inference\_accelerator| device_name:The Elastic Inference accelerator device name.The deviceName must also be referenced in a container definition as a ResourceRequirement.device_type:The Elastic Inference accelerator type to use. | `list(any)` | `[]` |  |
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
