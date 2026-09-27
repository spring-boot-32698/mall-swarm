# mall

## Technology stack

### Backend technologies

Technology | Name 
----|----
Spring Boot | Container + MVC framework
Spring Security | Authentication and authorization framework
MyBatis | ORM Framework  
MyBatisGenerator | Data layer code generation  
PageHelper | MyBatis Physical pagination plugin  
Swagger-UI | Documentation generation tool
Hibernator-Validator | Validation framework
Elasticsearch | Search engine
RabbitMq | Message queue
Redis | Distributed cache
MongoDb | NoSql Database
Docker | Application container engine
Druid | Database connection pool

### Frontend technologies

Technology | Name 
----|----
Vue | Frontend framework
Vue-router | Routing framework
Vuex | Global state management framework
Element | Frontend UI framework
Axios | Frontend HTTP framework
Js-cookie | cookie Management tools

### Framework setup

Feature | Complete 
----|----
Integration MyBatis | ✔
Integration MyBatisGenerator | ✔
Integration SpringSecurity | ✔
Integration Swagger-UI | ✔
Integration Hibernator-Validator | ✔
Integrate logging | ✔
Integrate monitoring | ✔
crud Actions demo | ✔
Plan the package structure sensibly | ✔
SpringAOP Common log handling | ✔
SpringAOP Common validation failure result response | ✔
CommonResult Wrap the common response result | ✔
SpringSecurity Login changed to a RESTful style | ✔
JWT Login, registration, get token | ✔
JTA Transaction handling | ✔
Integrate unit testing | ✔
OSS Upload feature | ✔
Elasticsearch Search feature | ✔
HTTPS Supports | ✔
Redis Numeric ID generation | ✔
SpringTask Scheduled task support | ✔
docker Containerized deployment | ✔
Configuration distinguishes production and test environments | ✔
ELK Log collection feature | ✔
RabbitMq Asynchronous communication | ✔
RestTemplate Inter-service calls | ✔
SpringSecurity Permission management features | ✔
Integration SpringCloud |

### Tools used

Tools | Download URL 
----|----
Development tools idea | https://www.jetbrains.com/idea/download
redis Client connection tool | https://redisdesktop.com/download
mongo Client connection tool | https://robomongo.org/download
Local host management | https://oldj.github.io/SwitchHosts/
Linux Remote connection tool | http://www.netsarang.com/download/software.html
Database connection tool | http://www.formysql.com/xiazai.html
Database design tool | http://powerdesigner.de/
Prototyping tool | https://www.axure.com/
Mind-map design tool | http://www.edrawsoft.cn/mindmaster
gif Recording tool | https://www.screentogif.com/

### Admin features

#### Admin login feature ✔

- Admin user registration feature
- Obtained after admin user login token
- Refresh token feature

#### Product management ✔

> **Product category management**

- View the category list with paging by parent category ID
- Add, edit, delete categories
- Transfer category products

> **Product brand management**

- Search by brand name and view the brand list with paging
- Add, edit, delete brands
- View all products of the current brand

> **Product attribute category management**

- Add product attribute category (name)
- Query all product attribute categories with paging
- Delete a single product attribute category
- Modify the name of a single attribute category
- Query information of a single attribute category

> **Product attribute management**

- Query attribute list or parameter list by category (paged, type supported)
- Add product attribute
- Query a single product attribute
- Edit product attribute
- Batch delete product attributes
- Query all product attributes with paging

> **Add product**

- Select product category: look up category by product category id
- Select brand: query all brands
- Select shipping template: query all shipping templates
- Set member prices: query all member levels, pass in List<PmsMemberPrice>
- Add tiered price: parameters passed in List<PmsProductLadder>
- Set full-reduction price: parameters passed in List<PmsProductFullReduction>
- Select product attribute category: get all product attribute categories, then get specifications and parameters by the attribute category id(type=0->Specifications;type=1->Parameters)
- Select specifications and generate stock info: implemented on the frontend
- Add SKU stock information: parameters passed in List<PmsSkuStock>
- Set attribute images: set into the pic and album_pics fields
- Add product parameters: parameters passed in List<PmsProductAttributeValue>
- Add custom product specifications: parameters passed in List<PmsProductAttributeValue>
- Associated topics: parameters passed in List<CmsSubjectProductRelation>Relation
- Associated preferred: parameters passed in List<CmsPrefrenceAreaProductRelation>Relation

> **Modify product**

- Query product info by product id
- Query basic product info: product category name, brand name, shipping template name
- Query product promotion info: member price, tiered price, full-reduction price
- Query product attribute info: attribute category name, SKU stock info, specifications and parameter values for the attribute category
- Query product association info: associated topics and preferred zones
- Modify product info: product attribute category and specifications cannot be modified; only individual SKUs can be modified, deleted or added; if attribute category and specifications can be modified: the original SKU stock and attribute category are shown after modification

> **Product paged query**

- Product statuses: all products, on shelf, off shelf, pending review, rejected (publishStatus verifyStatus)
- Product name(%name%)
- Product item number(productSn)
- Product category id(productCategoryId)
- Product brand id(brandId)
- Batch operations: on/off shelf, recommend, new arrival, move category, move to recycle bin, review
- View records: review records, operation logs
- sku:Get SKU info by product and SKU number, batch modify SKU info

> **Product recycle management**

- Show recycled product list with paging
- Recycled product restore feature

#### Promotion management

> **Flash sale activity management**

- Activity list display
- Activity online/offline
- Set activity products
- Add, edit, delete activities

> **Coupon management**

- Coupon list display
- Add, edit, delete coupons
- View coupon claim records

> **Activity management**

- Activity list display
- Add, edit, delete activities
- Activity online/offline
- Publish to advertisement

> **Home recommendations**

- Brand recommendations: list display, whether recommended, sorting, deletion, multi-select to add brands
- Fresh picks: product list display, whether recommended, sorting, deletion, multi-select to add products
- Popular recommendations: product list display, whether recommended, sorting, deletion, multi-select to add products
- Topic picks: topic list display, whether recommended, sorting, deletion, multi-select to add to topics
- Ad management: ad list display, whether online, sorting, deletion, add/edit ads

#### Content management

> **Topic management**

- Topic list: view, delete, recommend topics
- Add, edit topics: select topic category, add, delete associated products
- Topic category management: control display, sorting, edit and delete categories

> **Preferred theme**

- Preferred list: control display, sorting, deletion
- Add, edit preferred: associate and remove products

> **Topic management**

- Topic list: view, delete, hot topics
- Topic category management: control display, sorting, edit and delete categories

> **Help management**

- Help list: view, delete, control display
- Add, edit help: select help category
- Help category management: control display, sorting, edit and delete categories

#### User management

> **User management**

- User list: account enable, delete, mass SMS
- Batch operations: mass SMS, in-site message, push, set tags, grant coupons
- View and edit user info: user details (statistics, shipping addresses, order records), edit profile, login logs
- Purchasing power filters: recent spending, purchase count, spending amount, average order price, product category, member level, user tags
- User tag management: tag list, add, edit, delete
- Member level settings: list, add, edit, set default member level

> **Growth value and points**

- Growth value and points query: list display, points details, growth value details, modify values
- Task reward settings: newcomer tasks, daily tasks
- More rule settings: growth value rules, points rules, points consumption settings

#### Order management

> **Order list**

- Order search: order number, recipient name/number, order status, order category, order source, submission time
- Order operations: view order, close order, ship order, track order, delete order
- Batch operations: batch ship, close orders, delete orders

> **View order**

- Order status: submit order, pay order, platform ships, confirm receipt, review completed
- Order detail operations: modify invoice info, modify recipient info, modify product info, modify fee info, send in-site message, close order, add order remarks, cancel order, track order, delete order
- Basic order info: order info, discount info, user info
- Invoice info: type, title, content, recipient info
- Recipient info: recipient, phone number, postal code, shipping address
- Product info: includes basic product information
- Fee info: subtotal and discount info
- Operation info: order status change records

> **Order settings**

- Flash sale order timeout
- Normal order timeout
- Order auto-completion time
- Auto-end transaction time
- Auto-review time

> **Return request handling**

- Return request search: service order number, recipient name/number, handling status, application time, operator, handling time
- Batch operation: delete
- View details: returned products, service order info, confirm return, reject return, confirm receipt

> **Return reason settings**

- Reason list: type, sort, whether enabled, added time
- Add, edit reasons: same as above
- Batch operation: delete

#### Permission management ✔

> **Permission management**

- Permission management: add, delete, modify permissions, return permissions as a tree
- Role management: add role, delete role, update role, role list, get corresponding role permissions, modify corresponding role permissions
- Member management: add, edit, delete members, member list, assign roles to members, get member roles, assign +/- permissions, get permission list

Role | Menu 
----|----
Admin | All menu permissions
Operations | Home, users, promotions, operations, content
Finance | Home, statistics, finance
Designer | Home, products
Customer service | Home, products, orders

### Storefront features

#### Product search ✔

> **Comprehensive search feature**

- Search: search by product title, subtitle and keywords;
- Filtering: when no category is selected, aggregate the search results and pick the most frequent category; after a category is chosen, filter further using that category’s filter fields;
- Sort: by new arrivals, sales, price
- Search result: product ID, image, name, subtitle, price, sales, new arrival, product parameters, brand name, category name
- API: query the relevant data from the database and import it es,Insert (modify) data API, delete data API
- Brand category filter: aggregate and return brands, categories and attributes based on search results

> **Product recommendation feature**

- Recommend related products for a product, based on its brand (10), category (6), name (8), keywords (2), subtitle (2)
- Recommend products based on the user’s one-week browsing history and search records

> **Product trending search feature**

- Aggregate trending search terms from user search records

> **Product search suggestion feature** 

- Aggregate trending search terms from user search records

#### Shopping flow ✔

> **Shopping cart** 

- Add product to cart
- Cart product list (product main image, name, quantity, specifications)
- Modify product quantity in cart
- Reselect specifications for products in the cart
- Delete products in the cart

> **Generate confirmation order** 

- Generate confirmation order info: delivery info, product info, price info, invoice info, payment method
- Select shipping address: default shipping address
- Select coupon and points deduction: show usable and unusable coupons
- Calculate product price: product subtotal, shipping, coupon deduction, points deduction, activity discount
- Select payment method: online payment and cash on delivery
- Calculate amount payable: subtotal + shipping - coupon deduction - points deduction - activity discount

> **Submit order** 

- Convert confirmation order info into an order
- Delete related products from the cart
- Add the order to the database and lock stock
- Online payment method selection: Alipay, WeChat, UnionPay,ApplePay

> **Pay order**

- After payment completes, change order status to paid and deduct stock

> **Cancel order (when unpaid)**

- Automatically cancel orders after timeout, release product stock locks, return coupons and points

#### Member module (Me)✔

> **My follows**

- Followed brand list: brand logo, name, address, follower count
- Unfollow feature
- Follow list display

> **My favorites**

- Favorited products: product main image, name, selling point, price, find similar
- Favorited topics: topic main image, title, subtitle, favorite count, view count, comment count
- Favorited topics: topic main image, title, subtitle, favorite count, view count, comment count

> **My footprints**

- Browsed products: product main image, name, selling point, price, find similar
- Delete record feature
- Browsing list display

> **Member login and registration**

- Login feature: https login
- Registration: username, password, phone number, SMS verification code
- Get verification code: the backend generates the code, bound to the phone number
- Forgot password: phone number, SMS verification code, new password
- Logout feature
