# GCP Terraform

## GCP Funtions
- Main services:
  + Cloud Function
  + Cloud Scheduler
  + Cloud Pub/Sub
  + Cloud Storage

## GKE
- Main services:
  + Google Kubernetes Engine
- K8s manifests:
  + Deploymet
  + Ingress
  + Service

## Instance Group
- Main services:
  + Instance Group
  + Load Balancing
  + VPC

## Serverless
- Main services:
  + Cloud Run
  + Load Balancing

## Github Actions

| FILES | Description | Conditions |
| --- | --- | ---|
| trigger_plan.yaml | Dùng để trigger file plan.yml | Dispatch | 
| plan.yaml | Plan các folder | Sẽ chạy sau khi kích hoạt trigger plan |
| trigger_apply.yaml | Dùng để trigger file apply.yml | Dispatch | 
| apply.yaml | Apply các folder | Sẽ chạy sau khi kích hoạt trigger apply |
| lint.yaml | Kiểm tra format code | On Push, Pull_request | 
