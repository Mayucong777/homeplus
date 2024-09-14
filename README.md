# homeplus     
### 2021.06-2021.08               武汉中软国际信息技术有限公司                     后端开发实习生
### 参与项目：没家家政服务网站管理系统
### 项目技术：
   SpringMVC+Mybatis+MySQL+JavaScript+JDBC+Tomcat+JWT+Echarts
### 项目描述：
   根据现代老龄化严重的需求，设计一款用户能在网站上进行分页查询或模糊搜索等查看和预定保姆，选择服务开始结束时间，商家能对保姆人员信息以及发布信息等进行增删改查、类型统计等操作，用户和商家能互相留言聊天，为用户提供更好更高效的服务。
### 工作描述：
   作为小组组长，完成整个项目80%的工作量。包括设计和书写需求文档、技术的实施方案、相应功能的流程图、时序图等；前端：使用JavaScript、jQuery、html、ajax等技术设计并书写页面，支持轮播图、分页查询、模糊搜索、页面跳转、用户聊天以及Echarts图形化表格的数据填充；后端：设计了三种用户的数据库及ER图，包括用户、家政人员以及所属公司管理员，设计了留言聊天模块的嵌套数据库，使用SSM框架，实现对前端数据的获取、解析和转发到数据层，规范编码习惯，前后端交互使用RESTful方式，后端只返回json格式封装的data数据、msg错误码信息等，最后进行测试环境下的部署和相应功能的黑白盒测试。
   # 本地运行

登录网址：[http://localhost:8080/index.jsp](http://localhost:8080/index.jsp)

## 用到的技术

### 前端：
1. BootStrap  
2. sweetalert  
3. jquery  

### 后端：
1. Spring  
2. SpringMVC  
3. MyBatis  

### 数据库：
1. MySQL  

### 开发工具：
1. IDEA  
2. Navicat  

## 目录结构

|--src  
    |--main  
        |--java  
        |--controller  
        |--dao  
        |--interceptor  
        |--entity  
        |--service  
        |--utils  
    |--resources  
        |--mappers  
        |--db.properties  
        |--log4j.properties  
        |--mybatisConfig.xml  
        |--springContext-dao.xml  
        |--springContext-service.xml  
        |--springmvcContext.xml  

|--sql  
    |--houseplus.sql  


## 功能描述：

1. 用户的注册、登录、退出系统  
2. 用户的个性化推荐（基于物品的协同过滤）  
3. 家政人员上传资料、身份认证和资格认证  
4. 消费者发布预约、查看预约、确认预约、评价订单、删除订单、修改个人资料  
5. 家政人员修改个人资料、申请预约、接受订单、取消订单、完成订单  
6. 管理员对用户认证管理和系统的量化查看

## 后续添加...


   ### 登录页面：
   
   ![image](https://github.com/user-attachments/assets/6fde6820-5128-4a69-9609-7b1433959310)

   ### 用户主页面：
   
   ![image](https://github.com/user-attachments/assets/f07489f9-9a33-42b0-96e3-9fd9ee5c353e)
   
   ### 管理员主页面：
   
   ![image](https://github.com/user-attachments/assets/aa22b592-f5a6-4cf9-a227-149370d084af)
   
   ### 个人信息页面：
   
   ![image](https://github.com/user-attachments/assets/bd4bd7c2-84e3-4238-8556-2a49b75a7730)
   
   ### 用户注册页面：
   
   ![image](https://github.com/user-attachments/assets/57cce001-69da-4998-9af7-d2adbee6f56a)
   
   ### 家政人员界面：
   
   ![image](https://github.com/user-attachments/assets/79461476-c907-4d96-a22c-ccd7a259b51f)

   ![image](https://github.com/user-attachments/assets/4e172ce0-1715-49ca-a46a-80187b1b8515)
   
   ![image](https://github.com/user-attachments/assets/d02843ae-317b-49c1-8dcb-035aabf72766)
   
   ![image](https://github.com/user-attachments/assets/0d713435-bd18-4846-b7b7-3d19c1e42b68)
   
   ![image](https://github.com/user-attachments/assets/2e4ef80b-b5ec-4015-a25d-d1413559d1b7)
   
   ![image](https://github.com/user-attachments/assets/328b8fe5-5f6e-401a-bebb-2c8693aefd95)
   
   ### 评价模块：
   
   ![image](https://github.com/user-attachments/assets/161f970e-705b-4c88-90db-2a7a13ddf229)
   
   ### 留言聊天模块：
   
   ![image](https://github.com/user-attachments/assets/60cb4bc2-b199-4e31-9c95-fc71e3db08d6)
   
   ![image](https://github.com/user-attachments/assets/30d9286e-7640-4752-bfb0-15457a830aed)
   
   ![image](https://github.com/user-attachments/assets/53ff0a75-82f8-43e9-9279-6578e87550e6)
   
   ### 预约订单模块：
   
   ![image](https://github.com/user-attachments/assets/83748a2a-f8c9-4382-9e7d-4c57b3ee578f)
   
   ![image](https://github.com/user-attachments/assets/66bea5f5-359d-43c3-8008-6491166b9117)
   
   ![image](https://github.com/user-attachments/assets/a8cfec68-f43b-4745-9afa-75ec38ce5981)
   
   ### 用户、家政人员、商家认证模块：
   
   ![image](https://github.com/user-attachments/assets/a437d90f-ccb7-4b3d-a86c-00d34669e1ce)
   
   ![image](https://github.com/user-attachments/assets/11a29f26-77a7-425b-a8a9-2f93f072636d)
   
   ![image](https://github.com/user-attachments/assets/1fa16a7d-3714-4fe0-9f86-febd0bee0db2)

   


