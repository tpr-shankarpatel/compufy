
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
| aws\_ecs\_capacity\_provider | Wether you want to have ecs capacity provider resource. | `bool` | `"true"` |  |
| ecs\_capacity\_provider\_name | ecs capacity provider name. | `string` | `"null"` |  |
| ecs\_auto\_scalling\_grp\_arn | ARN of autoscalling group. | `string` | `"null"` |  |
| managed\_termination\_protection | Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens. Valid values are ENABLED and DISABLED. | `string` | `"DISABLED"` |  |
| managed\_scaling | parameters of the auto scaling:(max_scalling_step:The maximum step adjustment size),(min_scalling_step:The maximum step adjustment size),(status:Whether auto scaling is managed by ECS,Valid values are ENABLED and DISABLED),(target_capacity:The target utilization for the capacity provider. A number between 1 and 100.). | `list(object({
    maximum_scaling_step_size       = number
    minimum_scaling_step_size       = number
    status                          = string
    target_capacity                 = number
  }))
` | `null` |  |
| health\_check\_enabled | Indicates whether health checks are enabled. Defaults to true. | `bool` | `true` | no |
| health\_check\_healthy\_threshold | The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3. | `number` | `3` | no |
| health\_check\_interval | The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. | `number` | `10` | no |
| health\_check\_matcher | The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, `200,202`) or a range of values (for example, `200-299`). | `string` | `"200-299"` | no |
| health\_check\_path | The destination for the health check request. Applies to Application Load Balancers only (HTTP/HTTPS) | `string` | `"/"` | no |
| health\_check\_port | The port to use to connect with the target. Valid values are either ports 1-65535, or traffic-port. Defaults to `traffic-port.` | `string` | `"traffic-port"` | no |
| health\_check\_protocol | The protocol to use to connect with the target. Defaults to the value of the Target Groups `protocol` | `string` | n/a | yes |
| health\_check\_timeout | The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 120 seconds, and the default is 5 seconds for the instance target type and 30 seconds for the lambda target type. For Network Load Balancers, you cannot set a custom value, and the default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks. | `number` | `5` | no |
| health\_check\_unhealthy\_threshold | The number of consecutive health check failures required before considering the target unhealthy . For Network Load Balancers, this value must be the same as the healthy\_threshold. Defaults to 3. | `number` | `3` | no |
| host\_header | The host header for the condition block in the `aws_lb_listener_rule` | `string` | n/a | yes |
| instance\_ids | A list of instance\_ids to attache to the target group | `list(string)` | n/a | yes |
| name | The name of the target group. | `string` | n/a | yes |
| port | The port on which targets receive traffic, unless overridden when registering a specific target. | `string` | n/a | yes |
| protocol | The protocol to use for routing traffic to the targets. Should be one of `TCP, TLS, UDP, TCP_UDP, HTTP` or `HTTPS`. | `string` | n/a | yes |
| slow\_start | The amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. | `number` | `0` | no |
| stickiness\_cookie\_duration | The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds). | `number` | `86400` | no |
| stickiness\_enabled | Boolean to enable / disable stickiness. Default is true. | `bool` | `true` | no |
| tags | A map of tag = values to be applied to any resources.  Each resource will have the `Name` tag added to the tags before being applied. | `map(string)` | n/a | yes |
| target\_type | The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address) or lambda (targets are specified by lambda arn). The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses. If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify publicly routable IP addresses. | `string` | `"instance"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Target Group (matches id) |
| arn\_suffix | The ARN suffix for use with CloudWatch Metrics. |
| id | The ARN of the Target Group (matches arn) |
| name | The name of the Target Group. |
