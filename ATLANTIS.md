# Atlantis

## Dockerfile

```sh
FROM ghcr.io/runatlantis/atlantis:latest

USER root

## 1. terragrunt 설치
RUN apk update && apk add --no-cache curl jq \
    && TERRAGRUNT_VERSION=$(curl -sL https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | jq -r .tag_name) \
    && curl -L -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    && chmod +x /usr/local/bin/terragrunt

# 2. 환경 변수 설정
ENV ATLANTIS_GH_USER=leedonggyu
ENV ATLANTIS_REPO_ALLOWLIST=github.com/zkfmapf123/terragrunt-atlantis

RUN mkdir -p /home/atlantis/.atlantis/bin \
    && chown -R atlantis:atlantis /home/atlantis/.atlantis
COPY config/server.yaml /home/atlantis/.atlantis/server.yaml
RUN chown -R atlantis:atlantis /home/atlantis/.atlantis

USER atlantis

ENTRYPOINT ["atlantis", "server"]
```

## .env

```sh
ATLANTIS_GH_USER=leedonggyu                   ## 기재 요망
ATLANTIS_GH_TOKEN=[secret-token]                    ## 기재 요망
ATLANTIS_GH_WEBHOOK_SECRET=leedonggyu-1234

# AWS Region
AWS_DEFAULT_REGION=ap-northeast-2
```

## repos.yml

```sh
#  Server-side repo config
repos:
  - id: [repository]
    branch: /^(main|master)$/

    # Apply 전 요구사항
    apply_requirements:
      - approved
      - mergeable

    # Workflow 지정
    workflow: terraform-1-9  # ← 커스텀 workflow 사용

    # Repo의 atlantis.yaml 허용
    allowed_overrides:
      - apply_requirements
      - workflow

    allow_custom_workflows: true
    repo_config_file: atlantis.yaml

# 워크플로우에서 Terraform 버전 지정
workflows:
  terraform-1-9:  # ← 새 workflow
    plan:
      steps:        - env:
            name: ATLANTIS_TERRAFORM_VERSION
            value: 1.9.2
        - init
        - plan
    apply:
      steps:
        - env:
            name: ATLANTIS_TERRAFORM_VERSION
            value: 1.9.2
        - apply
```

## docker-compose.yml

```sh
version: '3.8'

services:
  atlantis:
    build:                     ## 해당 부분은 추후 ECR로 수정
      context: .
    container_name: atlantis
    restart: unless-stopped
    user: root

    ports:
      - "80:4141"

    environment:
      # GitHub 설정
      - ATLANTIS_ATLANTIS_URL=[atlantis-url]
      - ATLANTIS_GH_USER=${ATLANTIS_GH_USER}
      - ATLANTIS_GH_TOKEN=${ATLANTIS_GH_TOKEN}
      - ATLANTIS_GH_WEBHOOK_SECRET=${ATLANTIS_GH_WEBHOOK_SECRET}

      # Repo 허용 목록
      - ATLANTIS_REPO_ALLOWLIST=[repostiroy]

      # 서버 설정
      - ATLANTIS_DATA_DIR=/atlantis
      - ATLANTIS_PORT=4141
      - ATLANTIS_LOG_LEVEL=info

      # AWS Settings
      - AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
      - ATLANTIS_REPO_CONFIG=/etc/atlantis/repos.yaml
      - ATLANTIS_ALLOW_FORK_PRS=true ## fork PR 허용

    volumes:
      - data:/atlantis
      - ./repos.yaml:/etc/atlantis/repos.yaml:ro

    # Health check
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:4141/healthz"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```