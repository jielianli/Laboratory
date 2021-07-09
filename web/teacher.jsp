<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/12
  Time: 19:23
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
    <form action="TUpdate" method="post">
        <!--隐藏域，不给用户显示，但需要tid传参！-->

            <input type="hidden" name="tid" value="${nowteacher.tid}">

            教工号:<input type="text" name="tname" value="${nowteacher.tname}"><br>&nbsp;
            密码:<input type="text" name="tpass" value="${nowteacher.tpass}"><br> &nbsp;
            姓名:<input type="text" name="trueName" value="${nowteacher.trueName}"><br> &nbsp;
            院系:<input type="text" name="tdepartment" value="${nowteacher.tdepartment}"><br> &nbsp;
            联系方式:<input type="text" name="contact" value="${nowteacher.contact}"><br>
        <input  type="submit" value="确认修改">
</table>
</body>
</html>
