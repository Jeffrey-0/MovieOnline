# MiliMili

项目在线网址：[MiliMili](http://120.79.198.193:8080/index)

项目github地址：[MiliMili项目地址](https://github.com/Jeffrey-0/MovieOnline)

##  项目简介

咪哩咪哩免费提供用户观看各种视频资源，影视番剧，同时也有论坛区提供用户与用户之间交流，Up主可上传自制视频或者搬运其他视频。咪哩咪哩用于分享各种视频、影视番剧，现受广大用户青年的热爱与青睐，主要是用来休闲娱乐的一个网站。

## 运行效果

![img](/Web/img/M站效果图.gif)

## 功能模块

> 主页  分类  搜索   视频播放   论坛   我的视频  上传视频  注册登录

## 开发环境

- 操作系统：Windows 10
- 编程语言: Java 1.8
- 开发工具: IDEA、Navicat 、Git（非必须）
- 服务器：Tomcat 8.0
- 数据库: MySQL
- 代码托管平台: GitHub（非必须）

## 部署步骤

**数据库配置**

1. 新建一个webstore数据库，将项目中的 `webstore.sql`导入到webstore数据库中
2. 修改 `src/druid.properties`中username和password

**idea导入项目**[参考](https://www.cnblogs.com/qingyunfc/p/10284230.html)

1. 导入项目
2. 配置Project Structure
3. 配置Tomcat

## 目录结构

├─ out

├─ src

│  ├─ dao  //数据接口

│  ├─ model    //项目模型

│  ├─ servlet       //存放所有的servlet

│  ├─ test 

│  ├─ utils  //JDBC

│  └─ druid.properties //数据库连接参数

├─ web

│  ├─ assets2

│  ├─ css //css文件

│  ├─ img  //图片资源路径

│  ├─ js //js文件

│  ├─ WEB-INF // 依赖包

│  └─ *.jsp    //所有jsp页面

├─ .gitignore  // git忽略文件

├─ README.md

├─ sharee.iml

└─ webstore.sql    //数据库结构和数据



## 贡献者

<a href="https://github.com/Jeffrey-0"><img src="https://avatars0.githubusercontent.com/u/49424740?s=460&u=d3de943acc254c684bf42054596b5351e762cffd&v=4" width="50px"></img></a><a href="https://github.com/Aiiiiiiiiiiii"><img src="https://avatars1.githubusercontent.com/u/54297514?s=460&v=4" width="50px"></img></a>