<!-- VSCode Markdown Exclusions-->
<!-- markdownlint-disable MD025 Single Title Headers-->
# Tapestry AWS Autoscalling group (ALB) and launch template Terraform Module

## Examples

### basic
```hcl
module "asg" {
  source                   ="git@github.com:tapestryinc/aws_asg?ref=v1.0.0"
  create_autoscaling_group = true
  autoscaling_group_name   = "tapestryasg"
  max_instance_size        = 1
  min_instance_size        = 1
  desired_capacity         = 1
  health_check_type        = "EC2"
  target_group_arns        = "arn:aws:elasticloadbalancing:us-east-1:940154213284:targetgroup/ECS/f756058854067902"
  vpc_zone_identifier      = ["subnet-fd2d7ab0"]
  autoscaling_group_tags = [{
    key                 = "name"
    value               = "tapestryasg"
    propagate_at_launch = true
  }]
  disable_api_termination     = false

  # Launch Template 
  key_name                    = "myServer"
  create_launch_template      = true
  launch_template_name        = "tapestry"
  launch_template_description = "template_description"
  ami_image_id  = "ami-0affd4508a5d2481b"
  instance_type = "t2.micro"
  vpc_security_group_ids      = ["sg-081af78dd8176f46c"]
  set_placement_group_details = false
  iam_instance_arn            = "arn:aws:iam::871739047920:instance-profile/tapestry"
  userdata_cluster_name = "tapestry"
  additional_commands     = ["echo  'test' > /tmp/test", "ls", "yum install wget -y"]
  tag_specifications_tags = {
    name = "tapestry"
  }
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
| create\_autoscaling\_group | whether to create autoscaling group | `bool` | `false` | `yes` |
| autoscaling\_group\_name | The name of the Auto Scaling Group. | `string` | `null` | `no`  |
| max\_instance\_size | The maximum size of the Auto Scaling Group. | `number` | `4` | `yes` |
| min\_instance\_size | The minimum size of the Auto Scaling Group. | `number` | `1` | `yes` |
| availability\_zones | A list of one or more availability zones for the group. | `list(any)` | `null` | `no` |
| capacity\_rebalance | Indicates whether capacity rebalance is enabled. Otherwise, capacity rebalance is disabled. | `bool` | `false` | `no` |
| default\_cooldown | The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. | `number` | `null` | `no`  |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group. | `number` | `null` | `no` |
| use\_launch\_configuration | whether to use launch configuration to create the ASG | `bool` | `false` | `yes`  |
|launch\_configuration\_name | Name of launch configuration | `string` | `null` | `no` |
| use\_launch\_template | whether to use the launch template to create the ASG | `bool` | `true` | `yes` |
| launch\_template | launch template id and version | `any` | `{}` | `no` |
| health\_check\_grace\_period | Time (in seconds) after instance comes into service before checking health. | `number` | `300` | `no`  |
| health\_check\_type | EC2 or ELB. Controls how health checking is done.| `string` | `null` | `no` |
| force\_delete | Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate. | `string` | `true` | `no`  |
| load\_balancers | A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. | `list(string)` | `[]` | `no` |
| vpc\_zone\_identifier | A list of subnet IDs to launch resources in. | `list(string)` | `[]`| `no` |
| target\_group\_arns | A set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing. | `list(string)` | `[]` | `no` |
| termination\_policies | A list of policies to decide how the instances in the Auto Scaling Group should be terminated. | `list(string)` | `["Default"]` | `no` |
| suspended\_processes| A list of processes to suspend for the Auto Scaling Group.| `list(string)` | `null` | `no` |
| autoscaling\_group\_tags | autoscalning group tags , set of maps required | `any` | `{}` | `no` |
| placement\_group | The name of the placement group into which you'll launch your instances. | `string` | `null` | `no` |
| metrics\_granularity | The granularity to associate with the metrics to collect. The only valid value is 1Minute. | `string` | `"1Minute"` | `no` |
| enabled\_metrics | A list of metrics to collect. | `list(any)` | `null` | `no`  |
| wait\_for\_capacity\_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. | `string` | `"10m"` | `no` |
| min\_elb\_capacity | Setting this causes Terraform to wait for this number of instances from this Auto Scaling Group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. | `number` | `null` | `no` |
| protect\_from\_scale\_in | Allows setting instance protection. The Auto Scaling Group will not select instances with this setting for termination during scale in events.| `string` | `null` | `no`  |
| service\_linked\_role\_arn | The ARN of the service-linked role that the ASG will use to call other AWS services | `string` | `null` | `no` |
| max\_instance\_lifetime | The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds. | `number` | `86400` | `no` |
| instance\_refresh\_strategy | The strategy to use for instance refresh. The only allowed value is Rolling | `string` | `null` | `yes` |
| instance\_refresh\_triggers | The strategy to use for instance refresh. The only allowed value is Rolling | `list(string)` | `null` | `no` |
| pref\_min\_healthy\_percentage | The amount of capacity in the Auto Scaling group that must remain healthy during an instance refresh to allow the operation to continue, as a percentage of the desired capacity of the Auto Scaling group. | `number` | `90` | `no` |
| pref\_instance\_warmup\_seconds | The number of seconds until a newly launched instance is configured and ready to use.  | `number` | `null` | `no` |
| create\_autoscaling\_lifecycle\_hook | whether to create lifecycle hook for the autoscaling group | `bool` | `false` | `yes` |
| autoscaling\_lifecycle\_hook\_name | The name of the lifecycle hook. | `string` | `null` | `yes` |
| autoscaling\_lifecycle\_hook\_default\_result | Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON. The default value for this parameter is ABANDON. | `string` | `"ABANDON"` | `no` |
| autoscaling\_lifecycle\_hook\_heartbeat\_timeout | Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter| `number` | `10` | `no` |
| autoscaling\_lifecycle\_hook\_lifecycle\_transition | The instance state to which you want to attach the lifecycle hook. For a list of lifecycle hook types.| `string` | `null` | `yes` |
| autoscaling\_lifecycle\_hook\_notification\_metadata | Contains additional information that you want to include any time Auto Scaling sends a message to the notification target. | `string` | `null` | `no` |
| autoscaling\_lifecycle\_hook\_notification\_target\_arn |The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic.| `string` | `null` | `no` |
| autoscaling\_lifecycle\_hook\_role\_arn | The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target. | `string` | `null` | `no` |
| create\_autoscaling\_notification | whether to create lifecycle hook for the autoscaling group | `bool` | `false` | `yes`  |
| aws\_autoscaling\_notifications | A list of Notification Types that trigger notifications. Acceptable values are documented  | `list(string)` | `null` | `yes` |
| aws\_autoscaling\_notification\_topic\_arn | The Topic ARN for notifications to be sent through | `string` | `null` | `yes` |
| create\_autoscaling\_policy | whether to create autoscaling policy for the ASG | `bool` | `false` | `yes` |
| autoscaling\_policy\_name | The name of the policy. | `string` | `null` | `yes` |
| autoscaling\_policy\_adjustment\_type | Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity.| `string` | `null` | `no` |
| policy\_type\_name | scaling type valid values are : [SimpleScaling, StepScaling, TargetTrackingScaling ] | `string` | `null` | `no` |
| estimated\_instance\_warmup | The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period. | `number` | `null` | `no` |
|autoscaling\_policy\_cooldown | The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start. | `number` | `null` | `no` |
| autoscaling\_policy\_scaling\_adjustment | The number of instances by which to scale. adjustment_type determines the interpretation of this number | `string` | `null` | `no` |
| autoscaling\_policy\_min\_adjustment\_magnitude | Minimum value to scale by when adjustment_type is set to PercentChangeInCapacity. | `string` | `null` | `no` |
| autoscaling\_policy\_metric\_aggregation\_type | he aggregation type for the policy's metrics. Valid values are \"Minimum\", \"Maximum\", and \"Average\". Without a value, AWS will treat the aggregation type as \"Average\" | `string` | `null` | `no` |
| step\_adjustment | A set of adjustments that manage group scaling. These have the following structure: | `list(any)` | `null` | `no` |
| target\_tracking\_configuration | A target tracking policy. Note: Define predefined_metric_specification or customized_metric_specification| `list(any)` | `null` | `no` |
| create\_autoscaling\_schedule | whether to create autoscaling schedule | `bool` | `false` | `yes` |
| scheduled\_action\_name| The name of this scaling action. | `string` | `null` | `yes` |
| autoscaling\_schedule\_min\_size | he minimum size for the Auto Scaling group. Default 0. Set to -1 if you don't want to change the minimum size at the scheduled time.| `number` | `null` | `no` |
| autoscaling\_schedule\_max\_size | The minimum size for the Auto Scaling group. Default 0. Set to -1 if you don't want to change the minimum size at the scheduled time. | `number` | `null` | `no` |
| autoscaling\_schedule\_desired\_capacity | he number of EC2 instances that should be running in the group. Default 0. Set to -1 if you don't want to change the desired capacity at the scheduled time. | `number` | `null` | `no` |
| autoscaling\_schedule\_start\_time | he time for this action to start, in \"YYYY-MM-DDThh:mm:ssZ\" format in UTC/GMT only (for example, 2014-06-01T00:00:00Z ). If you try to schedule your action in the past, Auto Scaling returns an error message. | `string` | `null` | `no` |
| autoscaling\_schedule\_end\_time | The time for this action to end, in \"YYYY-MM-DDThh:mm:ssZ\" format in UTC/GMT only (for example, 2014-06-01T00:00:00Z ). If you try to schedule your action in the past, Auto Scaling returns an error message. | `string` | `null` | `no` |
| autoscaling\_schedule\_recurrence | The time when recurring future actions will start. Start time is specified by the user following the Unix cron syntax format.| "string" | `null`| `no` |
| create\_launch\_template | whether to create the launch template | `bool` | `true` | `yes` |
| launch\_template\_name | The name of the launch template. If you leave this blank, Terraform will auto-generate a unique name | `string` | `null` | `no` |
| launch\_template\_name\_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | `null` | `no` |
| launch\_template\_description | Description of the launch template. | `string` | `no` |
| launch\_template\_default\_version| Default Version of the launch template.| `string` | `null` | `no` |
| update\_default\_version | Whether to update Default Version each update. Conflicts with default_version. | `bool` | `true` | `no` |
| ram\_disk\_id | The ID of the RAM disk. | `string` | `null` | `no` |
| vpc\_security\_group\_ids | A list of security group IDs to associate with. | `list(string)` | `[]` | `no` |
| disable\_api\_termination | If true, enables EC2 Instance Termination Protection | `bool` | `true` | `no` |
| ebs\_optimized\_opts | If true, the launched EC2 instance will enable ebs_optimized variable. | `string` | `true` | `no` |
| ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized. | `string` | `false` | `no` |
| ami\_image\_id| The AMI from which to launch the instance. | `string` | | `yes` |
| instance\_initiated\_shutdown\_behavior | The market (purchasing) option for the instance. | `string` | `null` | `no` |
| instance\_type| the type of the instance. | `string` | | `yes` |
| key\_name | - The key name to use for the instance. | `string` | |  `yes` |
| userdata\_cluster\_name | The Base64-encoded user data to provide when launching the instance. // Provide container name to assign autoscalling group instances. | `string` |  | `yes` |
| additional\_commands | Add more commands in list format if you want to run when instance boots up | `list(string)` | `[]` | `no` |
| block\_device\_mappings | Specify volumes to attach to the instance besides the volumes specified by the AMI | `any` | `null` | `no` |
| capacity\_reservation\_preference | Targeting for EC2 capacity reservations. See Capacity Reservation Specification below for more details.| `string` | `null` | `no` |
| cpu\_core\_count | The number of CPU cores for the instance. | `number` | `null` | `no` |
| threads\_per\_core | he number of threads per CPU core. To disable Intel Hyper-Threading Technology for the instance, specify a value of 1. Otherwise, specify the default value of 2. | `number` | `null` | `no` |
| cpu\_credits | The credit option for CPU usage. Can be \"standard\" or \"unlimited\". T3 instances are launched as unlimited by default. T2 instances are launched as standard by default.| `string` | `null` | `no` |
| elastic\_gpu\_specifications\_type | The Elastic GPU Type | `string` | `null` | `no` |
| elastic\_inference\_accelerator\_type | attach an Elastic Inference Accelerator to the instance. Additional information about Elastic Inference in EC2 can be found in the EC2 User Guide.| `string` | `null` | `no` |
| iam\_instance\_profile\_name| The name of the instance profile. | `string` | | `no` |
| iam\_instance\_arn | The Amazon Resource Name (ARN) of the instance profile.| `string` | | `no` |
| license\_configuration\_arn | A list of license specifications to associate with. | `list(string)` | `null` | `no` |
| instance\_market\_options | Targeting for EC2 capacity reservations. See Capacity Reservation Specification below for more details. | `any` | `[]` | `no` |
| use\_instance\_metadata\_service | whether to customize instance metadata | `bool` | `false` | `no`  |
| http\_endpoint | Whether the metadata service is available. Can be enabled or disabled.  | `string` | `"enabled"` | `no` |
| http\_tokens | Whether or not the metadata service requires session tokens | `string` | `"optional"` | `no` |
| http\_put\_response\_hop\_limit | he desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel | `number` | `1` | `no` |
| monitoring\_enabled | If true, the launched EC2 instance will have detailed monitoring enabled. | `bool` | `false` | `no` |
| network\_interfaces | Customize network interfaces to be attached at instance boot time. | `list(any)` | `[]` | `no` |
| set\_placement\_group\_details | whether to set pleacement group details in the launch configuration | `bool` | `false` | `yes` |
| placement\_affinity | The affinity setting for an instance on a Dedicated Host. | `any` | `null` | `no` |
| placement\_availability\_zone | The Availability Zone for the instance.| `any` | `null` | `no` |
| placement\_group\_name | The name of the placement group for the instance. | `string` | `null` | `no` |
| placement\_host\_id | The ID of the Dedicated Host for the instance. | `string` | `null` | `no` |
| placement\_spread\_domain | Reserved for future use. | `string` | `null` | `no` |
| placement\_tenancy | The tenancy of the instance (if the instance is running in a VPC). Can be default, dedicated, or host. | `string` | `"default"` | `no` |
| placement\_partition\_number| The number of the partition the instance should launch in. Valid only if the placement group strategy is set to partition.| `string` | `null`| `no` |
| security\_group\_names | A list of security group names to associate with. If you are creating Instances in a VPC, use vpc_security_group_ids instead.| `list(string)` | `null` | `no` |
| tag\_specifications\_resource\_type | The type of resource to tag. Valid values are instance, volume, elastic-gpu and spot-instances-request.| `string` | `"instance"` | `no` |
| tag\_specifications\_tags | A map of tags to assign to the resource. | `map(any)` | `{}` | `yes` |
| hibernation\_configured | If set to true, the launched EC2 instance will hibernation enabled.| `bool` | `false` | `no` |
| enclave\_enabled| If set to true, Nitro Enclaves will be enabled on the instance.| `bool` | `false` | `no` |
| hibernation\_configured\_opts |Use this option if required | `bool` | `false` | `no` |
## Outputs

| Name | Description |
|------|-------------|
| autoscaling\_arn | The ARN for this Auto Scaling Group |
| autoscalling\_id| The Auto Scaling Group id. |
| availability\_zones | The availability zones of the Auto Scaling Group. |
| min\_size| The minimum size of the Auto Scaling Group |
| max\_size | The maximum size of the Auto Scaling Group |
| name | The name of the Auto Scaling Group |
| health\_check\_grace\_period | Time after instance comes into service before checking health. |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group. |
| vpc\_zone\_identifier | The VPC zone identifier |
| health\_check\_type | "EC2" or "ELB". Controls how health checking is done. |
| notifications |  |
| group\_names |  |
| topic\_arn |  |
| autoscaling\_policy\_arn | The ARN assigned by AWS to the scaling policy. |
| autoscaling\_policy\_name | The scaling policy's name. |
| autoscaling\_policy\_autoscaling\_group\_name | The scaling policy's assigned autoscaling group. |
| autoscaling\_policy\_adjustment\_type | The scaling policy's adjustment type.|
| autoscaling\_policy\_type | The scaling policy's type. |
| autoscaling\_schedule\_arn | The ARN assigned by AWS to the autoscaling schedule. |
