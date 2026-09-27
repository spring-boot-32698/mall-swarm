# mall-swarm

<p>
  <a href="#Official account"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%85%AC%E4%BC%97%E5%8F%B7-macrozheng-blue.svg" alt="Official account"></a>
  <a href="#Official account"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E4%BA%A4%E6%B5%81-%E5%BE%AE%E4%BF%A1%E7%BE%A4-2BA245.svg" alt="Communication"></a>
  <a href="https://github.com/macrozheng/mall-learning"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%AD%A6%E4%B9%A0%E6%95%99%E7%A8%8B-mall--learning-green.svg" alt="Tutorials"></a>
  <a href="https://github.com/macrozheng/mall"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%90%8E%E5%8F%B0%E9%A1%B9%E7%9B%AE-mall-blue.svg" alt="Admin project"></a>
  <a href="https://github.com/macrozheng/mall-admin-web"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%89%8D%E7%AB%AF%E9%A1%B9%E7%9B%AE-mall--admin--web-green.svg" alt="Frontend project"></a>
  <a href="https://github.com/macrozheng/mall-app-web"><img src="https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%89%8D%E5%8F%B0%E5%95%86%E5%9F%8E%E9%A1%B9%E7%9B%AE-mall--app--web-green.svg" alt="Storefront mall project"></a>
  <a href="https://gitee.com/macrozheng/mall-swarm"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E7%A0%81%E4%BA%91-%E9%A1%B9%E7%9B%AE%E5%9C%B0%E5%9D%80-orange.svg" alt="Gitee"></a>
</p>

## Friendly reminder

> 1. **Quick start project**: [Online access URL](https://cloud.macrozheng.com/admin/index.html) .
> 2. **Full set of tutorials**: [“mall-swarm Microservice Learning Tutorial”](https://cloud.macrozheng.com) .
> 3. **Video tutorials**: [“mall-swarm Video Tutorial”](https://cloud.macrozheng.com/video/) .
> 4. **Spring Cloud Full tutorials**: [“Spring Cloud Learning Tutorial”](https://github.com/macrozheng/springcloud-learning) .
> 5. **Branch description**: `master`This branch is based on Spring Cloud 2025 + Spring Boot 3.5,`dev-v2`This branch is based on Spring Cloud 2021 + Spring Boot 2.7.

## Project introduction

`mall-swarm`is a microservice mall system, using Spring Cloud 2025 & Alibaba, Spring Boot 3.5, Sa-Token, MyBatis, Elasticsearch, Docker, Kubernetes and other core technologies, and also provides a Vue-based admin dashboard for quickly building the system.`mall-swarm`On top of the e-commerce business it integrates registry center, configuration center, monitoring center, gateway and other system features. Documentation is complete, with a full set of Spring Cloud tutorials.

## Project demo

### Admin management system

Frontend project`mall-admin-web`Address:https://github.com/macrozheng/mall-admin-web

Project demo URL: [https://www.macrozheng.com/admin/index.html](https://www.macrozheng.com/admin/index.html)

![Admin management system feature demo](./document/resource/mall_admin_show.png)

### Storefront mall system

Frontend project`mall-app-web`Address:https://github.com/macrozheng/mall-app-web

Project demo URL (switch the browser to mobile mode for a better view):[https://www.macrozheng.com/app/](https://www.macrozheng.com/app/)

![Storefront mall system feature demo](./document/resource/re_mall_app_show.jpg)

## Project architecture

### System architecture

![System architecture diagram](./document/resource/mall_micro_service_arch.jpg)

### Business architecture

![Business architecture diagram](./document/resource/re_mall_business_arch.jpg)

### Organizational structure

``` lua
mall
├── mall-common -- Utility classes and common code modules
├── mall-mbg -- MyBatisGenerator Generated database operation code modules
├── mall-auth -- Unified authentication center based on Spring Security OAuth2
├── mall-gateway -- Microservice API gateway service based on Spring Cloud Gateway
├── mall-monitor -- Microservice monitoring center based on Spring Boot Admin
├── mall-admin -- Admin management system service
├── mall-search -- Product search system service based on Elasticsearch
├── mall-portal -- Mobile mall system service
├── mall-demo -- Microservice remote call test service
└── config -- Configuration stored in the config center
```

## Technology stack

### Backend technologies

| Technology                   | Description                 | Official website                                                 |
| ---------------------- | -------------------- | ---------------------------------------------------- |
| Spring Cloud           | Microservice framework           | https://spring.io/projects/spring-cloud              |
| Spring Cloud Alibaba   | Microservice framework           | https://github.com/alibaba/spring-cloud-alibaba      |
| Spring Boot            | Container + MVC framework         | https://spring.io/projects/spring-boot               |
| Sa-Token               | Authentication and authorization framework       | https://github.com/dromara/Sa-Token                   |
| MyBatis                | ORM Framework              | http://www.mybatis.org/mybatis-3/zh/index.html       |
| MyBatisGenerator       | Data layer code generation       | http://www.mybatis.org/generator/index.html          |
| PageHelper             | MyBatis Physical pagination plugin  | http://git.oschina.net/free/Mybatis_PageHelper       |
| Knife4j                | Documentation generation tool         | https://github.com/xiaoymin/swagger-bootstrap-ui     |
| Elasticsearch          | Search engine             | https://github.com/elastic/elasticsearch             |
| RabbitMq               | Message queue             | https://www.rabbitmq.com/                            |
| Redis                  | Distributed cache           | https://redis.io/                                    |
| MongoDb                | NoSql Database          | https://www.mongodb.com/                             |
| Docker                 | Application container engine         | https://www.docker.com/                              |
| Druid                  | Database connection pool         | https://github.com/alibaba/druid                     |
| OSS                    | Object storage             | https://github.com/aliyun/aliyun-oss-java-sdk        |
| MinIO                  | Object storage             | https://github.com/minio/minio                       |
| LogStash               | Log collection             | https://github.com/logstash/logstash-logback-encoder |
| Lombok                 | Object wrapping simplification utility     | https://github.com/rzwitserloot/lombok               |
| Seata                  | Global transaction management framework     | https://github.com/seata/seata                       |
| Portainer              | Visual Docker container management | https://github.com/portainer/portainer               |
| Jenkins                | Automated deployment tool       | https://github.com/jenkinsci/jenkins                 |
| Kubernetes             | Application container management platform     | https://kubernetes.io/                               |

### Frontend technologies

| Technology       | Description                  | Official website                           |
| ---------- | --------------------- | ------------------------------ |
| Vue        | Frontend framework              | https://vuejs.org/             |
| Vue-router | Routing framework              | https://router.vuejs.org/      |
| Vuex       | Global state management framework      | https://vuex.vuejs.org/        |
| Element    | Frontend UI framework            | https://element.eleme.io/      |
| Axios      | Frontend HTTP framework          | https://github.com/axios/axios |
| v-charts   | Chart framework based on Echarts | https://v-charts.js.org/       |

### Mobile technologies

| Technology         | Description             | Official website                                    |
| ------------ | ---------------- | --------------------------------------- |
| Vue          | Core frontend framework     | https://vuejs.org                       |
| Vuex         | Global state management framework | https://vuex.vuejs.org                  |
| uni-app      | Mobile frontend framework   | https://uniapp.dcloud.io                |
| mix-mall     | E-commerce project template     | https://ext.dcloud.net.cn/plugin?id=200 |
| luch-request | HTTP Request framework     | https://github.com/lei-mu/luch-request  |

## Environment setup

### Development environment

| Tools          | Version number | Download                                                         |
| ------------- | ------ | ------------------------------------------------------------ |
| JDK           | 17     | https://www.oracle.com/cn/java/technologies/downloads/#java17 |
| Mysql         | 5.7    | https://www.mysql.com/                                       |
| Redis         | 7.0    | https://redis.io/download                                    |
| Elasticsearch | 7.17.3 | https://www.elastic.co/cn/downloads/elasticsearch            |
| Kibana        | 7.17.3 | https://www.elastic.co/cn/downloads/kibana                   |
| Logstash      | 7.17.3 | https://www.elastic.co/cn/downloads/logstash                 |
| MongoDb       | 5.0    | https://www.mongodb.com/download-center                      |
| RabbitMq      | 3.10.5 | http://www.rabbitmq.com/download.html                        |
| nginx         | 1.22   | http://nginx.org/en/download.html                            |

### Setup steps

- Windows For environment setup please refer to:[mall-swarm Project backend development environment setup](https://cloud.macrozheng.com/start/mall_swarm_deploy_windows.html);
- `mall-admin-web`For project installation and deployment please refer to:[mall-swarm Frontend development environment setup](https://cloud.macrozheng.com/start/mall_swarm_deploy_windows_web.html);

## Running demo

- View registered service info in the registry center, access URL:http://192.168.3.101:8848/nacos/

![](./document/resource/re_mall_swarm_run_01.png)

- Monitoring center application info, access URL:http://192.168.3.101:8101

![](./document/resource/re_mall_swarm_run_02.png)

![](./document/resource/re_mall_swarm_run_03.png)

- API Documentation info, access URL:http://192.168.3.101:8201

![](./document/resource/re_mall_swarm_run_04.png)

- Log collection system info, access URL:http://192.168.3.101:5601

![](./document/resource/re_mall_swarm_run_05.png)

- Running status of the project after deploying with Kubernetes, access URL:http://192.168.3.101:30880

![](document/resource/re_mall_swarm_run_06.png)

![](document/resource/re_mall_swarm_run_07.png)

## Official account

Join the WeChat group to chat and follow the official account “**macrozheng**”, reply with “**Join group**” is enough.

![Official account image](http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/banner/qrcode_for_macrozheng_258.jpg)

## License

[Apache License 2.0](https://github.com/macrozheng/mall-swarm/blob/master/LICENSE)

Copyright (c) 2018-2026 macrozheng
## Run with Docker Compose

`docker-compose.yml` builds and starts every service together with its infrastructure
(MySQL, Redis, MongoDB, RabbitMQ, Elasticsearch + IK analyzer, Nacos). The SQL in
`document/sql/mall.sql` is imported on first start and `config/*/*-prod.yaml` is published to Nacos
by the one-shot `nacos-init` container.

```bash
docker compose up -d --build     # first build downloads Maven dependencies (a few minutes)
docker compose ps
docker compose down              # add -v to also delete the data volumes
```

| Service        | URL / port                                    |
| -------------- | --------------------------------------------- |
| mall-gateway   | http://localhost:8201 (`/mall-admin`, `/mall-portal`, `/mall-search`, `/mall-auth`) |
| mall-admin     | http://localhost:8080                         |
| mall-portal    | http://localhost:8085                         |
| mall-search    | http://localhost:8081                         |
| mall-auth      | http://localhost:8401                         |
| mall-monitor   | http://localhost:8101 (macro / 123456)        |
| Nacos          | http://localhost:8848/nacos                   |
| RabbitMQ       | http://localhost:15672 (mall / mall)          |

Default admin account: `admin` / `macro123`. The frontends live in the sibling projects
`mall-admin-web` and `mall-app-web`, each with its own `docker-compose.yml`; they call the gateway on port 8201.
