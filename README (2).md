
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
| create\_autoscaling\_group | whether to create autoscaling group | `bool` | `false` |  |
| autoscaling\_group\_name | The name of the Auto Scaling Group. | `string` | `null` |  |
| autoscaling\_name\_prefix | Creates a unique name beginning with the specified prefix | `string` | `null` |  |
| max\_instance\_size | The maximum size of the Auto Scaling Group. | `number` | `4' |  |
| min\_instance\_size | The minimum size of the Auto Scaling Group. | `number` | `1` |  |
| availability\_zones | A list of one or more availability zones for the group. | `list(any)` | `null` |  |
| capacity\_rebalance | Indicates whether capacity rebalance is enabled. Otherwise, capacity rebalance is disabled. | `bool` | `false` |  |
| default\_cooldown | The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. | `number` | `null` |  |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group. | `number` | `null` |  |
| use\_launch\_template | whether to use the launch template to create the ASG | `bool` | `true` |  |
| launch\_template | launch template id and version | `any` | `{}` |  |
| use\_launch\_configuration | whether to use launch configuration to create the ASG | `bool` | `false` |  |
|launch\_configuration\_name | Name of launch configuration | `string` | `null` |  |
| health\_check\_grace\_period | Time (in seconds) after instance comes into service before checking health. | `number` | `300` |  |
| health\_check\_type | EC2 or ELB. Controls how health checking is done.| `string` | `null` |  |
| force\_delete | Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate. | `string` | `true` |  |
| load\_balancers | A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. | `list(string)` | `[]` |  |
| vpc\_zone\_identifier | A list of subnet IDs to launch resources in. | `list(string)` | `[]`|  |
| target\_group\_arns | A set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing. | `list(string)` | `[]` |  |
| termination\_policies | A list of policies to decide how the instances in the Auto Scaling Group should be terminated. | `list(string)` | `["Default"]` |  |
| suspended\_processes| A list of processes to suspend for the Auto Scaling Group.| `list(string)` | `null` |  |
| autoscaling\_group\_tags | autoscalning group tags , set of maps required | `any` | `{}` |  |
| placement\_group | The name of the placement group into which you'll launch your instances. | `string` | `null` |  |
| metrics\_granularity | The granularity to associate with the metrics to collect. The only valid value is 1Minute. | `string` | `"1Minute"` |  |
| enabled\_metrics | A list of metrics to collect. | `list(any)` | `null` |  |
| wait\_for\_capacity\_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. | `string` | `"10m"` |  |
| min\_elb\_capacity | Setting this causes Terraform to wait for this number of instances from this Auto Scaling Group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. | `number` | `null` |  |
| protect\_from\_scale\_in | Allows setting instance protection. The Auto Scaling Group will not select instances with this setting for termination during scale in events.| | `null` |  |
| service\_linked\_role\_arn | The ARN of the service-linked role that the ASG will use to call other AWS services |  | `null` |  |
| instance\_refresh\_strategy | The strategy to use for instance refresh. The only allowed value is Rolling | `string` | `null` |  |
| instance\_refresh\_triggers | The strategy to use for instance refresh. The only allowed value is Rolling | `list(string)` | `null` |  |
| pref\_min\_healthy\_percentage | The amount of capacity in the Auto Scaling group that must remain healthy during an instance refresh to allow the operation to continue, as a percentage of the desired capacity of the Auto Scaling group. | `number` | `90` |  |
| pref\_instance\_warmup\_seconds | The number of seconds until a newly launched instance is configured and ready to use.  | `number` | `null` |  |
| max\_instance\_lifetime | The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds. |  | `86400` |  |
| lb\_type | Type of load balancers [ classic or alb/nlb] | `string`    |  |
| asa\_load\_balancer | The name of the ELB or  The ARN of an ALB Target Group. | `list(object({alb_target_group_arn = string elb = string})` |  |  |
| create\_autoscaling\_lifecycle\_hook | whether to create lifecycle hook for the autoscaling group | `bool` | `false` |  |
| autoscaling\_lifecycle\_hook\_name | The name of the lifecycle hook. | `string` | `null` |  |
| autoscaling\_lifecycle\_hook\_default\_result | Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON. The default value for this parameter is ABANDON. |  | `"ABANDON"` |  |
| autoscaling\_lifecycle\_hook\_heartbeat\_timeout | Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter| `number` | `10` |  |
| autoscaling\_lifecycle\_hook\_lifecycle\_transition | The instance state to which you want to attach the lifecycle hook. For a list of lifecycle hook types.| `string` | `null` |  |
| autoscaling\_lifecycle\_hook\_notification\_metadata | Contains additional information that you want to include any time Auto Scaling sends a message to the notification target. | `string` | `null` |  |
| autoscaling\_lifecycle\_hook\_notification\_target\_arn |The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic.| `string` | `null` |  |
| autoscaling\_lifecycle\_hook\_role\_arn | The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target. | `string` | `null` |  |
| create\_autoscaling\_notification | whether to create lifecycle hook for the autoscaling group | `bool` | `false` |  |
| aws\_autoscaling\_notifications | A list of Notification Types that trigger notifications. Acceptable values are documented  | `list(string)` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |
| create\_autoscaling\_policy | whether to create autoscaling policy for the ASG | `bool` | `false` |  |
| autoscaling\_policy\_name | The name of the policy. | `string` | `null` |  |
| autoscaling\_policy\_adjustment\_type | Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity.| `string` | `null` |  |
| policy\_type\_name | scaling type valid values are : [SimpleScaling, StepScaling, TargetTrackingScaling ] | `string` | `null` |  |
| estimated\_instance\_warmup | The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period. | `number` | `null` |  |
|autoscaling\_policy\_cooldown | The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start. | `number` | `null` |  |
| autoscaling\_policy\_scaling\_adjustment | The number of instances by which to scale. adjustment_type determines the interpretation of this number | `string` | `null` |  |
| autoscaling\_policy\_min\_adjustment\_magnitude | Minimum value to scale by when adjustment_type is set to PercentChangeInCapacity. | `string` | `null` |  |
| autoscaling\_policy\_metric\_aggregation\_type | he aggregation type for the policy's metrics. Valid values are \"Minimum\", \"Maximum\", and \"Average\". Without a value, AWS will treat the aggregation type as \"Average\" | `string` | `null` |  |
| step\_adjustment | A set of adjustments that manage group scaling. These have the following structure: | `list(object({scaling_adjustment = number metric_interval_lower_bound = number metric_interval_upper_bound = number}))` | `null` |  |
| target\_tracking\_configuration | A target tracking policy. Note: Define predefined_metric_specification or customized_metric_specification| `list(object(predefined_metric_specification = list(object({predefined_metric_type = string resource_label = string}))customized_metric_specification = list(object({metric_dimension = list(object({name  = string value = string}))metric_name = string namespace = string statistic = string unit = string}))target_value = number disable_scale_in = bool}))` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` |  |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Target Group (matches id) |
| arn\_suffix | The ARN suffix for use with CloudWatch Metrics. |
| id | The ARN of the Target Group (matches arn) |
| name | The name of the Target Group. |
