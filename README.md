# Atalntis

## Install Docker 

```sh
sudo yum install -y docker
sudo usermod -aG docker ec2-user
sudo systemctl enable --now docker
exec bash

sudo docker ps

sudo mkdir -p /usr/local/lib/docker/cli-plugins/
sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m)" -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker compose version
```

## install use ECS Fargate

[ecs code](./attlantis/ecs-fargate/main.tf)

## 1. webhook url 등록하기

![1](./public/1.png)
![2](./public/2.png)
![3](./public/3.png)
![4](./public/4.png)

## 2. Webhook Relay 를 사용해서 Atlantis 구축하기

- [Atlantis EC2 구성](./attlantis/ec2/main.tf)



## Best Practice

- AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY를 환경변수에 넣고 활용...
- 깃 레포에 특정 폴더 하위만 진행하기

## Reference

- <a href="https://registry.terraform.io/modules/terraform-aws-modules/atlantis/aws/latest?tab=inputs"> Atalntis Terraform Module </a>
- <a href="https://webhookrelay.com/blog/using-drone-for-simple-selfhosted-ci-cd"> WebHook Relay Self hosted </a>