<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/5
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<table >
    <h2><a href="culumadd.jsp">添加课程</a></h2>
    <tr>
        <th>课程名</th>
        <th>教室</th>
        <th>班级</th>
        <th>负责教师</th>
        <th>起始时间</th>
        <th>结束时间</th>
        <th>星期</th>
        <th>上课时间段</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${requestScope.culumlist}" var="culist">
        <tr>
            <td>${culist.cuname}</td>
            <td>${culist.cuclassroom}</td>
            <td>${culist.cuclass}</td>
            <td>${culist.trueName}</td>
            <td>${culist.starttime}</td>
            <td>${culist.endtime}</td>
            <td>${culist.cuweek}</td>
            <td>${culist.cusection}</td>
            <td>
                <a href="Goupdateculum?cuid=${culist.cuid}">修改</a>&nbsp;
                <a href="deleteculum?cuid=${culist.cuid}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
