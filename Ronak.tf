## auto scalling group

variable "create_autoscaling_group" {
  description = "whether to create autoscaling group"
  type        = bool
  default     = false
}

variable "autoscaling_group_name" {
  type        = string
  description = "The name of the Auto Scaling Group."
  default     = null
}

variable "max_instance_size" {
  type        = number
  description = "The maximum size of the Auto Scaling Group."
  default     = 4
}

variable "min_instance_size" {
  type        = number
  description = "The minimum size of the Auto Scaling Group."
  default     = 1
}

variable "availability_zones" {
  type        = list(any)
  description = "A list of one or more availability zones for the group."
  default     = null
}

variable "capacity_rebalance" {
  type        = bool
  description = "Indicates whether capacity rebalance is enabled. Otherwise, capacity rebalance is disabled."
  default     = false
}

variable "default_cooldown" {
  type        = number
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
  default     = null
}

variable "desired_capacity" {
  type        = number
  description = "The number of Amazon EC2 instances that should be running in the group."
  default     = null
}

variable "use_launch_configuration" {
  description = "whether to use launch configuration to create the ASG "
  type        = bool
  default     = false
}

variable "launch_configuration_name" {
  description = "Name of launch configuration"
  type        = string
  default     = null
}

variable "use_launch_template" {
  description = "whether to use the launch template to create the ASG"
  type        = bool
  default     = true
}

variable "launch_template" {
  description = "launch template id and version"
  type        = any
  default     = {}
}

variable "health_check_grace_period" {
  type        = number
  description = "Time (in seconds) after instance comes into service before checking health."
  default     = 300
}

variable "health_check_type" {
  type        = string
  description = "EC2 or ELB. Controls how health checking is done."
  default     = null
}

variable "force_delete" {
  type        = string
  description = " Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate."
  default     = true
}

variable "load_balancers" {
  type        = list(string)
  default     = []
  description = "A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers."
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
  default     = []
}

variable "target_group_arns" {
  type        = list(string)
  description = "A set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing."
  default     = []
}

variable "termination_policies" {
  type        = list(string)
  description = "A list of policies to decide how the instances in the Auto Scaling Group should be terminated."
  default     = ["Default"]
}

variable "suspended_processes" {
  type        = list(string)
  description = "A list of processes to suspend for the Auto Scaling Group."
  default     = null
}

variable "autoscaling_group_tags" {
  description = "autoscalning group tags , set of maps required"
  type        = any
  default     = {}
}

variable "placement_group" {
  type        = string
  description = "The name of the placement group into which you'll launch your instances."
  default     = null
}

variable "metrics_granularity" {
  type        = string
  description = " The granularity to associate with the metrics to collect. The only valid value is 1Minute."
  default     = "1Minute"
}

variable "enabled_metrics" {
  type        = list(any)
  description = "A list of metrics to collect."
  default     = null
}

variable "wait_for_capacity_timeout" {
  type        = string
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out."
  default     = "10m"
}

variable "min_elb_capacity" {
  type        = number
  description = "Setting this causes Terraform to wait for this number of instances from this Auto Scaling Group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes."
  default     = null
}

variable "protect_from_scale_in" {
  description = "Allows setting instance protection. The Auto Scaling Group will not select instances with this setting for termination during scale in events."
  default     = null
  type        = string 
}

variable "service_linked_role_arn" {
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services"
  default     = null
  type        = string
}

variable "max_instance_lifetime" {
  description = "The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds."
  default     = 86400
  type        = number
}

variable "instance_refresh_strategy" {
  type        = string
  description = "The strategy to use for instance refresh. The only allowed value is Rolling"
  default     = null
}

variable "instance_refresh_triggers" {
  type        = list(string)
  description = "The strategy to use for instance refresh. The only allowed value is Rolling"
  default     = null
}

variable "pref_min_healthy_percentage" {
  type        = number
  description = "The amount of capacity in the Auto Scaling group that must remain healthy during an instance refresh to allow the operation to continue, as a percentage of the desired capacity of the Auto Scaling group."
  default     = 90
}

variable "pref_instance_warmup_seconds" {
  type        = number
  description = "The number of seconds until a newly launched instance is configured and ready to use. "
  default     = null
}

## autoscalling attachment not needed as we are attaching autoscaling group to load balancer with arn
# variable "lb_type" {
#     description = "Type of load balancers [ classic or alb/nlb]"
#     type = string
# }

# variable "asa_load_balancer" {
#     description = "The name of the ELB or  The ARN of an ALB Target Group."
#     type = list(
#     object({
#       alb_target_group_arn = string
#       elb            = string
#     })
# }

## aws_autoscaling_lifecycle_hook

variable "create_autoscaling_lifecycle_hook" {
  description = "whether to create lifecycle hook for the autoscaling group"
  type        = bool
  default     = false
}

variable "autoscaling_lifecycle_hook_name" {
  description = " The name of the lifecycle hook."
  type        = string
  default     = null
}

variable "autoscaling_lifecycle_hook_default_result" {
  description = "Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON. The default value for this parameter is ABANDON."
  default     = "ABANDON"
}

variable "autoscaling_lifecycle_hook_heartbeat_timeout" {
  description = "Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter"
  type        = number
  default     = 10
}

variable "autoscaling_lifecycle_hook_lifecycle_transition" {
  description = " The instance state to which you want to attach the lifecycle hook. For a list of lifecycle hook types."
  type        = string
  default     = null
}

variable "autoscaling_lifecycle_hook_notification_metadata" {
  description = "Contains additional information that you want to include any time Auto Scaling sends a message to the notification target."
  type        = string
  default     = null
}

variable "autoscaling_lifecycle_hook_notification_target_arn" {
  description = "The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic."
  type        = string
  default     = null
}

variable "autoscaling_lifecycle_hook_role_arn" {
  description = "The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target."
  type        = string
  default     = null
}

## aws_autoscaling_notification_

variable "create_autoscaling_notification" {
  description = "whether to create lifecycle hook for the autoscaling group"
  type        = bool
  default     = false
}

variable "aws_autoscaling_notifications" {
  description = "A list of Notification Types that trigger notifications. Acceptable values are documented "
  type        = list(string)
  default     = null
}

variable "aws_autoscaling_notification_topic_arn" {
  description = "The Topic ARN for notifications to be sent through"
  type        = string
  default     = null
}

# # ## autoscaling_policy

variable "create_autoscaling_policy" {
  description = "whether to create autoscaling policy for the ASG"
  type        = bool
  default     = false
}

variable "autoscaling_policy_name" {
  description = " The name of the policy."
  type        = string
  default     = null
}

variable "autoscaling_policy_adjustment_type" {
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity."
  type        = string
  default     = null
}

variable "policy_type_name" {
  description = "scaling type valid values are : [SimpleScaling, StepScaling, TargetTrackingScaling ]"
  type        = string
  default     = null
}

variable "estimated_instance_warmup" {
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period."
  default     = null
  type        = number
}

variable "autoscaling_policy_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start."
  type        = number
  default     = null
}

variable "autoscaling_policy_scaling_adjustment" {
  description = "The number of instances by which to scale. adjustment_type determines the interpretation of this number"
  type        = string
  default     = null
}

variable "autoscaling_policy_min_adjustment_magnitude" {
  description = "Minimum value to scale by when adjustment_type is set to PercentChangeInCapacity."
  type        = string
  default     = null
}

variable "autoscaling_policy_metric_aggregation_type" {
  description = "he aggregation type for the policy's metrics. Valid values are \"Minimum\", \"Maximum\", and \"Average\". Without a value, AWS will treat the aggregation type as \"Average\""
  type        = string
  default     = null
}

variable "step_adjustment" {
  description = "A set of adjustments that manage group scaling. These have the following structure:"
  type        = any
  default     = null
}
/**
Example usage of step_adjustment
step_adjustment = [{
    scaling_adjustment          = -1
    metric_interval_lower_bound = 1.0
    metric_interval_upper_bound = 2.0 
  }]
**/

variable "target_tracking_configuration" {
  description = "A target tracking policy. Note: Define predefined_metric_specification or customized_metric_specification"
  type        = any
  default     = null
}
/**
Example usage of 
[{
    predefined_metric_specification = {
      predefined_metric_type        = "ASGAverageCPUUtilization"
      resource_label                = ""
    }
    customized_metric_specification = [{
      metric_dimension              = [{
        name                        = "fuga"
        value                       = "fuga"
      }]
      metric_name                   = "hoge"
      namespace                     = "hoge"
      statistic                     = "Average"
      unit                          =  ""
    }]
    target_value                    = 40.0
    disable_scale_in                = false
  }]
**/

# schedule

variable "create_autoscaling_schedule" {
  description = "whether to create autoscaling schedule"
  type        = bool
  default     = false
}

variable "scheduled_action_name" {
  description = "The name of this scaling action."
  type        = string
  default     = null
}

variable "autoscaling_schedule_min_size" {
  description = "he minimum size for the Auto Scaling group. Default 0. Set to -1 if you don't want to change the minimum size at the scheduled time."
  type        = number
  default     = null
}

variable "autoscaling_schedule_max_size" {
  description = "The minimum size for the Auto Scaling group. Default 0. Set to -1 if you don't want to change the minimum size at the scheduled time."
  type        = number
  default     = null
}

variable "autoscaling_schedule_desired_capacity" {
  description = "he number of EC2 instances that should be running in the group. Default 0. Set to -1 if you don't want to change the desired capacity at the scheduled time."
  type        = number
  default     = null
}

variable "autoscaling_schedule_start_time" {
  description = "he time for this action to start, in \"YYYY-MM-DDThh:mm:ssZ\" format in UTC/GMT only (for example, 2014-06-01T00:00:00Z ). If you try to schedule your action in the past, Auto Scaling returns an error message."
  type        = string
  default     = null

}

variable "autoscaling_schedule_end_time" {
  description = " The time for this action to end, in \"YYYY-MM-DDThh:mm:ssZ\" format in UTC/GMT only (for example, 2014-06-01T00:00:00Z ). If you try to schedule your action in the past, Auto Scaling returns an error message."
  type        = string
  default     = null
}

variable "autoscaling_schedule_recurrence" {
  description = "The time when recurring future actions will start. Start time is specified by the user following the Unix cron syntax format."
  default     = null
}

##launch template

variable "create_launch_template" {
  type        = bool
  description = "whether to create the launch template"
  default     = true
}

variable "launch_template_name" {
  type        = string
  description = "The name of the launch template. If you leave this blank, Terraform will auto-generate a unique name"
  default     = null
}

variable "launch_template_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "launch_template_description" {
  description = " Description of the launch template."
  type        = string
  default     = ""
}

variable "launch_template_default_version" {
  description = " Default Version of the launch template."
  type        = string
  default     = null
}

variable "update_default_version" {
  description = " Whether to update Default Version each update. Conflicts with default_version."
  type        = bool
  default     = true
}

variable "ram_disk_id" {
  description = " The ID of the RAM disk."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = " A list of security group IDs to associate with."
  type        = list(string)
  default     = []
}

variable "disable_api_termination" {
  description = " If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = true
}

variable "ebs_optimized_opts" {
  description = " If true, the launched EC2 instance will enable ebs_optimized variable."
  type        = string
  default     = true
}
variable "ebs_optimized" {
  description = " If true, the launched EC2 instance will be EBS-optimized."
  type        = string
  default     = false
}

variable "ami_image_id" {
  description = "The AMI from which to launch the instance."
  type        = string
  default     = ""
}

variable "instance_initiated_shutdown_behavior" {
  description = "The market (purchasing) option for the instance. See Market Options below for details."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "the type of the instance."
  type        = string
  default     = ""
}

variable "key_name" {
  description = " - The key name to use for the instance."
  type        = string
  default     = ""
}

variable "userdata_cluster_name" {
  description = "The Base64-encoded user data to provide when launching the instance. // Provide cluster name to assign autoscalling group instances"
  # type = string
}

variable "additional_commands" {
  description = "Add more commands in list format if you want to run when instance boots up"
  type        = list(string)
  default     = []
}

variable "block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
  type        = any
  default     = null
}

variable "capacity_reservation_preference" {
  description = "Targeting for EC2 capacity reservations. See Capacity Reservation Specification below for more details."
  type        = string
  default     = null
}

variable "cpu_core_count" {
  description = "The number of CPU cores for the instance."
  type        = number
  default     = null
}

variable "threads_per_core" {
  description = "he number of threads per CPU core. To disable Intel Hyper-Threading Technology for the instance, specify a value of 1. Otherwise, specify the default value of 2."
  type        = number
  default     = null
}

variable "cpu_credits" {
  description = "The credit option for CPU usage. Can be \"standard\" or \"unlimited\". T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."
  type        = string
  default     = null
}

variable "elastic_gpu_specifications_type" {
  description = "The Elastic GPU Type"
  type        = string
  default     = null
}

variable "elastic_inference_accelerator_type" {
  description = "attach an Elastic Inference Accelerator to the instance. Additional information about Elastic Inference in EC2 can be found in the EC2 User Guide."
  type        = string
  default     = null
}

variable "iam_instance_profile_name" {
  description = " The name of the instance profile."
  type        = string
  default     = ""
}

variable "iam_instance_arn" {
  description = "he Amazon Resource Name (ARN) of the instance profile."
  type        = string
  default     = ""
}

variable "license_configuration_arn" {
  description = " A list of license specifications to associate with. See License Specification below for more details."
  type        = list(string)
  default     = null
}

variable "instance_market_options" {
  description = "Targeting for EC2 capacity reservations. See Capacity Reservation Specification below for more details."
  type        = any
  default = [{
    market_type = null
    spot_option = []
  }]
}
/**
Example usage of instance_market_options
instance_market_options = [{
    market_type                      = spot
    spot_option                      = [{
      block_duration_minutes         = 60
      instance_interruption_behavior = "stop"
      max_price                      = 1000
      spot_instance_type             = "persistent"
      valid_until                    = "2021-10-2"
    }]
  }]
**/

variable "use_instance_metadata_service" {
  description = "whether to customize instance metadata"
  type        = bool
  default     = false
}

variable "http_endpoint" {
  description = "Whether the metadata service is available. Can be enabled or disabled. "
  type        = string
  default     = "enabled"
}

variable "http_tokens" {
  description = "Whether or not the metadata service requires session tokens"
  type        = string
  default     = "optional"
}

variable "http_put_response_hop_limit" {
  description = "he desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel"
  type        = number
  default     = 1
}

variable "monitoring_enabled" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  type        = bool
  default     = false
}

variable "network_interfaces" {
  description = "Customize network interfaces to be attached at instance boot time."
  type        = any
  default     = []
}
/**
Example usage of network_interfaces
network_interfaces = [{
    associate_public_ip_address  = "eth0"
    associate_carrier_ip_address = ""
    delete_on_termination        = true
    description                  = "any"
    device_index                 = 0
    ipv6_addresses               = ""
    ipv6_address_count           = 1
    network_interface_id         = ""
    private_ip_address           = ""
    ipv4_address_count           = 1
    ipv4_addresses               = ""
    security_groups              = ["sg-081af78dd8176f46c"]
    subnet_id                    = ["subnet-fd2d7ab0"]
  }]
**/

variable "set_placement_group_details" {
  description = "whether to set pleacement group details in the launch configuration"
  type        = bool
  default     = false
}

variable "placement_affinity" {
  description = " The affinity setting for an instance on a Dedicated Host."
  type        = any
  default     = null
}

variable "placement_availability_zone" {
  description = "The Availability Zone for the instance."
  type        = any
  default     = null
}

variable "placement_group_name" {
  description = " The name of the placement group for the instance."
  type        = string
  default     = null
}

variable "placement_host_id" {
  description = "The ID of the Dedicated Host for the instance."
  type        = string
  default     = null
}

variable "placement_spread_domain" {
  description = "Reserved for future use."
  type        = string
  default     = null
}

variable "placement_tenancy" {
  description = " The tenancy of the instance (if the instance is running in a VPC). Can be default, dedicated, or host."
  type        = string
  default     = "default"
}

variable "placement_partition_number" {
  description = " The number of the partition the instance should launch in. Valid only if the placement group strategy is set to partition."
  type        = string # I think we dont need
  default     = null
}

# variable "security_group_names" {
#   description = "A list of security group names to associate with. If you are creating Instances in a VPC, use vpc_security_group_ids instead."
#   type        = list(string)
#   default     = null
# }

variable "tag_specifications_resource_type" {
  description = "The type of resource to tag. Valid values are instance, volume, elastic-gpu and spot-instances-request."
  type        = string
  default     = "instance"
}

variable "tag_specifications_tags" {
  description = " A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "hibernation_configured" {
  description = " If set to true, the launched EC2 instance will hibernation enabled."
  type        = bool
  default     = false
}

variable "enclave_enabled" {
  description = " If set to true, Nitro Enclaves will be enabled on the instance."
  type        = bool
  default     = false
}

variable "hibernation_configured_opts" {
  description = "Use this option if required"
  type        = bool
  default     = false
}
