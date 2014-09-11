PGO	<br/>[![Build Status](https://travis-ci.org/solarisy/PGO.png)](https://travis-ci.org/profile/solarisy)
==============================================================================

- ----项目管理系统（Project Management System） 

#项目背景
一个小型的IT公司，管理其所承建的IT项目。

# 功能列表
### 人员管理

### 账号管理
-  1 登录  待测试
-  2 退出  待测试
-  3 注册  待测试
-  4 找回密码  待完成

### 项目管理

# 技术
- 使用[SpringSide](https://github.com/springside/springside4 "SpringSide4.2.2")搭建项目框架
- 持久层去掉Hibernate,全部使用Mybatis，基本的增、删、改、查、分页等方法使用代码生成器生成；基于注解的事务，精确控制每一个方法。
- 前端页面模板：[Metronic](http://dreamsky.github.io/main/blog/metronic-bootstrap/) – 超赞！基于 Bootstrap 的响应式后台管理模板。Metronic 拥有简洁优雅的 Metro UI 风格界面，6 种颜色可选，76 个模板页面，包括图表、表格、地图、消息中心、监控面板等后台管理项目所需的各种组件。
- 使用[travis-ci](https://travis-ci.org)做持续集成：单元测试、基于火狐的功能测试。

