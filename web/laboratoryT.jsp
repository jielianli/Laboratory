<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/12
  Time: 22:22
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
<table>
    <tr>
        <th>教学楼</th>
        <th>教室</th>
        <th>容纳人数</th>
        <th>是否空闲</th>
        <th>备注</th>
        <th>教室状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${sessionScope.laboratoryT}" var="list">
        <tr>
            <td>${list.lbuilding}</td>
            <td>${list.lclassroom}</td>
            <td>${list.laccommodate}</td>
            <td>
                <c:if test="${list.lfree=='0'}">是</c:if>
                <c:if test="${list.lfree=='1'}">否</c:if>
            </td>
            <td>${list.lremarks}</td>
            <td>
                <c:if test="${list.roomstate=='0'}">启用</c:if>
                <c:if test="${list.roomstate=='1'}">停用</c:if>
            </td>
            <td>
                <c:if test="${list.roomstate=='0'}">
                   实验室开启，可以预约！
                    <a href="GoorderT?lid=${list.lid}">点击预约</a>

                </c:if>

                <c:if test="${list.roomstate=='1'}">
                    该实验室已经关闭！
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
