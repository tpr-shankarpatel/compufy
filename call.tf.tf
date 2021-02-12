// aws_ecs_capacity_provider
variable "create_ecs_capacity_provider" {
  description = "Wether you want to have ecs capacity provider resource"
  type        = bool
  default     = true
}

variable "ecs_capacity_provider_name" {
  description = "ecs capacity provider name"
  type        = string
  default     = null
}

variable "ecs_auto_scalling_grp_arn" {
  type        = string
  description = "ARN of autoscalling group"
  default     = null
}

variable "managed_termination_protection" {
  description = "Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens. Valid values are ENABLED and DISABLED."
  type        = string
  default     = "DISABLED"
}

variable "managed_scaling" {
  description = "parameters of the auto scaling:(max_scalling_step:The maximum step adjustment size),(min_scalling_step:The maximum step adjustment size),(status:Whether auto scaling is managed by ECS,Valid values are ENABLED and DISABLED),(target_capacity:The target utilization for the capacity provider. A number between 1 and 100.)"
  type = any
  default = null
}
/**
Example usage of managed scalling
managed_scalling = [{
    maximum_scaling_step_size = 1
    minimum_scaling_step_size = 1
    status                    = "ENABLED"
    target_capacity           = 2
  }]
**/

// aws_ecs_cluster

variable "create_cluster" {
  description = "Wether you want to have ecs cluster resource"
  type        = bool
  default     = true
}

variable "ecs_use_fargate" {
  description = "If ecs use fargate or not."
  type        = bool
  default     = false
}
variable "cluster_name" {
  description = "The service name."
  type        = string
  default     = ""
}

variable "capacity_providers" {
  description = "List of short names of one or more capacity providers to associate with the cluster. Valid values also include FARGATE and FARGATE_SPOT"
  type        = list(any)
  default     = []
}

variable "ecs_tags" {
  description = "Key-value map of resource tags"
  type        = map(any)
  default     = {}
}

variable "default_capacity_provider_strategy" {
  description = "The capacity provider strategy to use by default for the cluster. Can be one or more."
  type = any
  default = null
}
/**
Example usage of default_capacity_provider_strategy
default_capacity_provider_strategy = [{
    capacity_provider = "tapestry"
    weight            = 70
    base              = 50
  }]
**/

variable "insights_setting" {
  description = "Configuration block(s) with cluster settings. For example, this can be used to enable CloudWatch Container Insights for a cluster. "
  type = any
  default = null
}
/**
Example usage of insights_setting
insights_setting = [{
    name    = "containerInsights"
    ecs_val = "enabled"
  }]
**/


// aws_ecs_service

variable "create_ecs_service" {
  description = "Wether you want to have ecs service resource"
  type        = bool
  default     = true
}

variable "ecs_service_name" {
  description = "The service name."
  type        = string
  default     = ""
}

variable "existing_cluster_arn" {
  description = "if we need to give existing cluster ARN"
  type        = string
  default     = null
}

variable "ecs_service_type_of_deployment_controller" {
  description = "Type of deployment controller. Valid values: CODE_DEPLOY, ECS, EXTERNAL. Default: ECS"
  type        = string
  default     = "ECS"
}

variable "tasks_desired_count" {
  description = "he number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy."
  type        = number
  default     = 0
}

variable "tasks_minimum_healthy_percent" {
  description = "Lower limit on the number of running tasks."
  type        = number
  default     = 0
}

variable "tasks_maximum_percent" {
  description = "Upper limit on the number of running tasks."
  type        = number
  default     = 0
}

variable "enable_ecs_managed_tags" {
  description = "Specifies whether to enable Amazon ECS managed tags for the tasks within the service."
  type        = bool
  default     = true
}

variable "force_new_deployment" {
  description = "Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination"
  type        = bool
  default     = true
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers."
  type        = number
  default     = null
}

variable "iam_role_arn" {
  description = "ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf."
  type        = string
  default     = ""
}

variable "platform_version" {
  description = "The platform version on which to run your service. Only applicable for launch_type set to FARGATE. Defaults to LATEST"
  type        = string
  default     = "LATEST"
}

variable "propagate_tags" {
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION."
  type        = string
  default     = null
}

variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy."
  type        = string
  default     = "REPLICA"
}

variable "wait_for_steady_state" {
  description = "Terraform will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing."
  type        = bool
  default     = false
}

variable "capacity_provider_strategy" {
  description = "The capacity provider strategy to use by default for the cluster. Can be one or more."
  type = any
  default = []
}

/**
Example usage of capcity_provider_strategy
capcity_provider_strategy = [{
    capacity_provider = "tapestry"
    weight            = 70
    base              = 50
  }]
**/

variable "ordered_placement_strategy" {
  description = "Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. The maximum number of ordered_placement_strategy blocks is 5"
  type = any
  default = []
}
/**
Example usage of ordered_placement_strategy
ordered_placement_strategy = [{
    ordered_placement_strategy_type  = "binpack"
    ordered_placement_strategy_field = "memory"
  }]
**/

variable "network_configuration" {
  description = "The network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes."
  type = any
  default = null
}
/**
Example usage of network_configuration
network_configuration = [{
    subnets = ["subnet-fd2d7ab0"]
    # security_groups = ["sg-081af78dd8176f46c"]
    assign_public_ip = false
  }]
**/

variable "load_balancer" {
  description = "List of load balancer target group objects containing the lb_target_group_arn, container_port and container_health_check_port. The container_port is the port on which the container will receive traffic. The container_health_check_port is an additional port on which the container can receive a health check. The lb_target_group_arn is either Application Load Balancer (ALB) or Network Load Balancer (NLB) target group ARN tasks will register with."
  type = any
  default = []
}

/**
Example usage of load_balancer
load_balancer = [{
    container_port      = 80
    lb_target_group_arn = "alb.target_group_arns"
    # elb_name            = "tapestry"
  }]
**/

variable "lb_type" {
  description = "Load balancer type possible values are Classic or alb or nlb"
  type        = string
  default     = null
}

variable "target_container_name" {
  description = "The name of the container to associate with the load balancer"
  type        = string
  default     = null
}

variable "service_registries" {
  description = "List of service registry objects as per https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1."
  type = any
  default = []
}

/**
Example usage of service_registries
service_registries = [{
    registry_arn   = ""
    container_name = "tapestry"
    container_port = 
    port           = 80
  }]
**/

// aws_ecs_task_definition

variable "create_ecs_task_definition" {
  description = "Wether you want to have ecs task definition resource"
  type        = bool
  default     = true
}

variable "family_name" {
  description = "A unique name for your task definition."
  type        = string
}

variable "container_definitions_json" {
  description = "A list of valid container definitions provided as a single valid JSON document. Please note that you should only provide values that are part of the container definition document."
  type        = string
  default     = ""
}

variable "task_role_arn" {
  description = "The AWS IAM role that will be provided to the task to perform AWS actions."
  type        = string
  default     = ""
}

variable "task_network_mode" {
  description = "The network mode to be used in the task definiton. Supported modes are awsvpc and bridge."
  default     = "bridge"
  type        = string
}

variable "task_cpu" {
  description = "CPU value for the task, required for FARGATE."
  type        = string
  default     = null
}

variable "task_memory" {
  description = "Memory value for the task, required for FARGATE."
  type        = string
  default     = null
}

variable "service_launch_type" {
  description = "The launch type, can be EC2 or FARGATE."
  type        = string
  default     = "EC2"
}

variable "task_execution_role_arn" {
  description = "The role arn used for task execution. Required for network mode awsvpc."
  type        = string
  default     = null
}

variable "ipc_mode" {
  default     = null
  description = "The IPC resource namespace to use for the containers in the task"
}

variable "pid_mode" {
  default     = null
  description = "The process namespace to use for the containers in the task"
}

variable "volume" {
  default     = []
  description = "A list of volume definitions in JSON format that containers in your task may use"
  type = any
}
/**
Example usage of volume
volume = {
    host_path                        = "/ecs/service-storage"
    name                             = "service-storage"
    docker_volume_configuration      = [{
      autoprovision                  = true
      driver                         = "local"
      driver_opts                    = {
        "type"                       = "nfs"
        "device"                     = "${aws_efs_file_system.fs.dns_name}:/"
        "o"                          = "addr=${aws_efs_file_system.fs.dns_name},rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport"
      }
      labels                         = "tapestry"
      scope                          = "shared"
    }]
    efs_volume_configuration = [{
      file_system_id                 = "aws_efs_file_system.fs.id"
      root_directory                 = "/opt/data"
      transit_encryption             = "ENABLED"
      transit_encryption_port        = 2999
      authorization_config {
        access_point_id              = aws_efs_access_point.test.id
        iam                          = "ENABLED"
      }
      authorization_config_iam       = "ENABLED"
    }]
  }
**/

variable "placement_constraints" {
  description = "Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. Updates to this configuration will take effect next task deployment unless force_new_deployment is enabled. The maximum number of ordered_placement_strategy blocks is 5. Defined below."
  type = any
  default = []
}
/**
Example usage of placement_constraints
placement_constraints = [{
    placement_constraints_type       = "distinctInstance"
    placement_constraints_expression = ""
  }]
**/

variable "proxy_configuration" {
  description = "(Optional) The proxy configuration details for the App Mesh proxy. This is a list of maps, where each map should contain \"container_name\", \"properties\" and \"type\""
  type = any
  default = []
}

/**
Example usage of proxy_configuration
proxy_configuration = [{
    container_name = "tapestry"
    properties     = ""
    type           = "APPMESH"
  }]
**/

variable "inference_accelerator" {
  description = "device_name:The Elastic Inference accelerator device name.The deviceName must also be referenced in a container definition as a ResourceRequirement.device_type:The Elastic Inference accelerator type to use."
  type = any
  default = []
}
/**
Example usage of inference_accelerator
inference_accelerator = [{
    device_name = "tapestry"
    device_type = ""
  }]
**/

variable "task_definition_tag" {
  description = "A map of tags to add to ECS task_deffination_tag"
  type        = map(string)
  default     = {}
}