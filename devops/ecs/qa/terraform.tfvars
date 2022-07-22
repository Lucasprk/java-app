account = "759041471414"
region = "us-east-1"
environment = "vista-qa"
vpc_id = "vpc-2c0e6251"
alb_name = "vista-qa-general-apps-alb"
cluster_name = "backend-apis"

application = {
  name: "bank-integration-api"
  port: 8080
  context: "/bank-integration-api-qa"
  health_check_path: "/bank-integration-api-qa/actuator/health"
  log_retention_days: 14
  environment_variables: [
    {
      name  = "SPRING_PROFILES_ACTIVE"
      value = "qa"
    }
  ]
  execution_role_name: "vista-qa-ecs-task-role"
  task_role_name: "vista-qa-ecs-task-role"
  ecr: "vista-qa/bank-integration-api" // Must be exists in ECR
  providers: [
    {
      capacity_provider = "vista-qa-backend-apis-spot-capacity-provider"
      weight = 50
    }
  ]
}