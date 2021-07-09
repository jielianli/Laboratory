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
    <h2><a href="teacher.jsp">查看个人信息</a></h2>
    <h2><a href="LaboratoryT">查看空闲实验室</a></h2>
    <h2> <a href="culumT?tid="${nowteacher.tid}">查看课程</a></h2>
    <h2><a href="selectOrderT">查看预约详情</a></h2>
</body>
</html>
