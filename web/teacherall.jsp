<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/4
  Time: 22:52
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
    <style>
        table,th,td{
            borde:1px soild black;
        }
        table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<center>
    <h2><a href="teacheradd.jsp">添加教师账号</a></h2>
    <table >
        <tr>
            <th>教工号</th>
            <th>密码</th>
            <th>姓名</th>
            <th>院系</th>
            <th>联系方式</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${requestScope.teacherlist}" var="list">
            <tr>
                <td>${list.tname}</td>
                <td>${list.tpass}</td>
                <td>${list.trueName}</td>
                <td>${list.tdepartment}</td>
                <td>${list.contact}</td>
                <td>
                    <a href="Goupdateteacher?tid=${list.tid}">修改</a>&nbsp;
                    <a href="deleteteacher?tid=${list.tid}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>
