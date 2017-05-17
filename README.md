# BookManage
**Spring4.0.2 + MyBatis3.2.6 + SpringMVC + Maven 3.3.9**
前端使用**Bootstrap**框架进行简单编写
数据库使用 **Mysql 5.5** 数据库
分页使用**PageHelper**工具
在sql文件夹里有生成数据库的文件
将sql文件导入mysql数据库后，就可以将项目启动起来。

使用**Maven**的分模块开发，将每一层分开出来，父项目就是简单的**java**项目，在pom.xml在配置<modules>节点。
详情见父项目的**pom.xml**。
当然，子项目下也有自己的pom.xml，可以针对当前模块使用到的jar包进行配置。
父类的pom.xml就不会显得臃肿。


在**ssm-model**的**src/main/resource**下有用于生成**Model**以及**Mapper(generatorConfig.xml)mybatis generator**（仅仅用于相对应的实体类以及mapper.xml），查看generatorConfig.xml
里面有相关配置。在**JavaBean**的**bookUpdatetime**属性上 **@DatetimeFormat** 注解，解决时间格式化问题。同时，需要在spring-mvc.xml中进行**<mvc:annotation-driven />**

**ssm-dao**项目下就是**XXX-Mapper**接口以及**Mapper-#.xml**的相关映射。有常用的增删改查方法

**ssm-service**项目下是相关的service接口以及相关实现类，结构非常清晰。调用**ssm-dao**的方法就能实现。。。

**ssm-controller**项目在  **src/main/java com.jiang.controller** 路径下的类控制逻辑以及跳转，在类名上一行***@Controller***注解，声明当前类是一个控制器。
同时使用**@RequestMapping**，在进行跳转可以更具体的指定到某一个控制器，主要用于区分。
当然，在controller下面的每一个方法也指定具体的@RequestMapping，可以与前端发过来的请求，对应上，执行相关操作。
**PageController**控制类用于 页面跳转，可以解决无法访问WEB-INF下页面的问题。在进行跳转的时候，结构更加清晰。
在 bookService 上 @Autowired 注解，spring 会自动注入。



整合shiro流程：
1.获取当前的Subject. 调用SecurityUtils.getSubject();
2.测试当前的用户是否已经被认证，即是否已经登录，调用Subject的isAuthenticated()
3.若没有被认证，则把用户名和密码封装为UsernamePasswordToken 对象
    1) 创建一个表单页面
    2) 把请求提交到SpringMVC 的Controller
    3) 获取用户名和密码
4.执行登录：调用 Subject 的login(AuthenticationToken)方法
5.自定义realm的方法，从数据库中获取对应的记录，返回给Shiro
    1).实际上需要继承org.apache.shiro.realm.AuthenticationRealm方法
    2).实现doGetAuthenticationInfo(AuthenticationToken) 方法.
6.由shiro完成对密码的比对.


_待续......_
