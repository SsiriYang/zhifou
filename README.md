# 知否( 社区问答系统，仿知乎开发）

基于 JSP+Servlet 开发的社区问答系统，初学JavaWeb的练手项目。

> 这是作者和朋友在大学时，初学javaweb开发的练手项目；所以各方面功能的设计以及后面的代码都缺乏可用性，主要以学习为主，
>
> 如果这个项目觉得很 low，请勿喷。本人git上有其他进阶的项目。
>
> 欢迎大家 star 或者 fork。
>
> 

- 个人博客地址：https://ssiriyang.github.io/

  

### 项目运行环境： 

**java8+mysql5.7+redis+tomcat7**



### 主要实现的功能：

- 登陆与注册
- 提问与回答
- 后台审核（审核提出的问题，通过才会显示在前端）
- 对回答进行点赞（redis实现）
- 后台统计网站在线人数
- 后台根据每天的浏览人数绘制折线统计图。

### 以下是项目部分截图

在本地部署完成后访问：

http://localhost/zhifou/index.jsp -主页

![image-20200220233845203](https://raw.githubusercontent.com/SsiriYang/zhifou/master/ReadmeImg/image-20200220233845203.png)

登录页面：

![image-20200220234007383](https://raw.githubusercontent.com/SsiriYang/zhifou/master/ReadmeImg/image-20200220234007383.png)

提问：

![image-20200220234208272](https://raw.githubusercontent.com/SsiriYang/zhifou/master/ReadmeImg/image-20200220234208272.png)





访问后台：http://localhost/zhifou/adminlogin.jsp

![image-20200220234328216](https://raw.githubusercontent.com/SsiriYang/zhifou/master/ReadmeImg/image-20200220234328216.png)

问题审核：

![image-20200220234352771](https://raw.githubusercontent.com/SsiriYang/zhifou/master/ReadmeImg/image-20200220234352771.png)

发布公告与类型管理：

![image-20200220234435104](https://raw.githubusercontent.com/SsiriYang/zhifou/master/ReadmeImg/image-20200220234435104.png)