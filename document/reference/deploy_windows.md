# mall-swarm Deployment on Windows

## Development environment setup

> `mall-swarm`Environment used in`mall`Roughly the same across projects; for details see[mall Deployment on Windows](https://github.com/macrozheng/mall-learning/blob/master/docs/deploy/mall_deploy_windows.md).

Simple environment setup process:

- Install IDEA and import the project source code;
- Install MySQL and create a`mall`database, and import`/document/sql/mall.sql`file;
- Install Redis, Elasticsearch, MongoDB, RabbitMQ and other environments.

## Project deployment

> `mall-swarm`The project must be started in a specific order; please start in the following order.

### Start registry center`mall-registory`

- Simply run the main function of com.macro.mall.MallRegistryApplication;
- After it runs you can view via the registry center console:http://localhost:8001

### Start configuration center`mall-config`

- Simply run the main function of com.macro.mall.MallConfigApplication;
- Access the following API to get the mall-admin configuration in the dev environment:http://localhost:8301/master/admin-dev.yml

### Start monitoring center`mall-monitor`

- Simply run the main function of com.macro.mall.MallMonitorApplication;
- After it runs you can view via the monitoring center console:http://localhost:8101
- Enter account and password`macro:123456`You can log in to view.

### Start gateway service`mall-gateway`

- Simply run the main function of com.macro.mall.MallGatewayApplication;
- Access the following API to get the dynamic routing rules:http://localhost:8201/actuator/gateway/routes

### Start admin management service`mall-admin`

- Simply run the main function of com.macro.mall.MallAdminApplication;
- Pass`mall-gateway`Gateway service API documentation:http://localhost:8201/mall-admin/swagger-ui.html

![](../resource/mall_swarm_windows_06.png)

- Login API URL:http://localhost:8201/mall-admin/admin/login
- After obtaining the token from the login API, put it in the authentication header to access other APIs that require login:

![](../resource/mall_swarm_windows_09.png)

### Start storefront service`mall-portal`

- Simply run the main function of com.macro.mall.portal.MallPortalApplication;
- Pass`mall-gateway`Gateway service API documentation:http://localhost:8201/mall-portal/swagger-ui.html

![](../resource/mall_swarm_windows_07.png)

- Login API URL:http://localhost:8201/mall-portal/sso/login
- APIs that require login are called the same way as`mall-admin`.

### Start search service`mall-search`

- Simply run the main function of com.macro.mall.search.MallSearchApplication;
- Pass`mall-gateway`Gateway service API documentation:http://localhost:8201/mall-search/swagger-ui.html

![](../resource/mall_swarm_windows_10.png)

### Start test service`mall-demo`

- Simply run the main function of com.macro.mall.MallAdminApplication;
- Pass`mall-gateway`Gateway service API documentation:http://localhost:8201/mall-demo/swagger-ui.html

![](../resource/mall_swarm_windows_08.png)

- You can test the Feign remote call feature by calling FeignAdminController, FeignPortalController and FeignSearchController.

## Demo

- Registry center service info:

![](../resource/mall_swarm_windows_01.png)

- Monitoring center service overview:

![](../resource/mall_swarm_windows_02.png)

![](../resource/mall_swarm_windows_03.png)

- Monitoring center single-application details:

![](../resource/mall_swarm_windows_04.png)

![](../resource/mall_swarm_windows_05.png)


