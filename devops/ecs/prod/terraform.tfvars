region = "sa-east-1"
account = "430537850870"
environment = "vista-prod"
vpc_id = "vpc-04db925e149877ca3"
alb_name = "vista-prod-general-apps-alb"
cluster_name = "vista-prod-backend-apis"

application = {
  name: "bank-integration-api"
  port: 8080
  context: "/bank-integration-api"
  health_check_path: "/bank-integration-api/actuator/health"
  log_retention_days: 14
  environment_variables: [
    {
      name  = "SPRING_PROFILES_ACTIVE"
      value = "prod"
    }
  ]
  execution_role_name: "vista-prod-ecs-task-role"
  task_role_name: "vista-prod-ecs-task-role"
  ecr: "vista-prod/bank-integration-api" // Must be exists in ECR
  providers: [
    {
      capacity_provider = "vista-prod-backend-apis-spot-capacity-provider"
      weight = 50
    }
  ]
}