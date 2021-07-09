<%@ page import="com.gy.Bean.Laboratory" %><%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/11
  Time: 11:31
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
    <%
        Laboratory t = (Laboratory) request.getAttribute("laboratory");
    %>
    <form action="laboratoryUpdate" method="post">
        <!--隐藏域，不给用户显示，但需要tid传参！-->
        <input type="hidden" name="lid" value="<%out.print(t.getLid());%>">

        教学楼:<input type="text" name="lbuilding" value="<%out.print(t.getLbuilding());%>"><br>&nbsp;
        教室:<input type="text" name="lclassroom" value="<%out.print(t.getLclassroom());%>"><br> &nbsp;
        人数：<input type="text" name="laccommodate" value="<%out.print(t.getLaccommodate());%>"><br>&nbsp;
        是否空闲：
        <select name="lfree" >
            <option value="1">否</option>
            <option value="0">是</option>
        </select><br>&nbsp;
        备注：
        <textarea name="lremarks"  cols="30"rows="5"><%out.print(t.getLremarks());%></textarea><br>&nbsp;
        教室状态：
        <select name="roomstate">
            <option value="1">停用</option>
            <option value="0">启用</option>
        </select><br>&nbsp;
        <input  type="submit" value="确认修改">

    </form>
</center>
</body>
</html>
