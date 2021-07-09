<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/4
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath %>"/>
    <title>Title</title>
</head>
<body>
    <h1>欢迎管理员：${sessionScope.nowadmin.aname},登录后台管理！欢迎欢迎</h1>
    <br>
<center>
    <h2 style="border: red"><a href="selectteacher">查看教师信息</a></h2>
    <h2><a href="selectculum">查看课程信息</a></h2>
    <h2><a href="selectLaborad">查看实验室</a></h2>
    <h2><a href="selectOrder">查看预约详情</a></h2>
</center>
</body>
</html>
