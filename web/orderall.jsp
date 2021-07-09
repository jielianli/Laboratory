<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/8
  Time: 18:04
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
<center>
    <h2><a href="orderadd.jsp">预约实验室！</a></h2>
    <table >
        <tr>
            <th>教学楼</th>
            <th>教室</th>
            <th>预约时间</th>
            <th>开始日期</th>
            <th>结束日期</th>
            <th>星期</th>
            <th>上课时间段</th>
            <th>课程名字</th>
            <th>项目名称</th>
            <th>班级</th>
            <th>人数</th>
            <th>描述</th>
            <th>预约状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${requestScope.orderlist}" var="list">
            <tr>
                <td>${list.lbuilding}</td>
                <td>${list.lclassroom}</td>
                <td>${list.orderDate}</td>
                <td>${list.starttime}</td>
                <td>${list.endtime}</td>
                <td>${list.cuweek}</td>
                <td>${list.cusection}</td>
                <td>${list.cuname}</td>
                <td>${list.cuproject}</td>
                <td>${list.cuclass}</td>
                <td>${list.cunumber}</td>
                <td>${list.cudescribe}</td>
                <td>
                <td>
                    <c:if test="${list.state=='1'}">未同意预约请求</c:if>
                    <c:if test="${list.state=='0'}">已同意预约请求</c:if>
                </td>
                </td>
                <td>
                    <a href="Goupdateorder?oid=${list.oid}">修改</a>&nbsp;
                    <a href="deleteorder?oid=${list.oid}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>
