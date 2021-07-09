<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/11
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
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
<center>
    <form action="laboratoryAdd" method="post">
        教学楼:<input type="text" name="lbuilding" value=""><br>&nbsp;
        教室:<input type="text" name="lclassroom" value=""><br> &nbsp;
         人数：<input type="text" name="laccommodate" value=""><br>&nbsp;
        是否空闲：
        <select name="lfree">
            <option value="1">否</option>
            <option value="0">是</option>
        </select><br>&nbsp;
        备注：

        <textarea name="lremarks"  cols="30" rows="5">
        </textarea><br>&nbsp;
        教室状态：
        <select name="roomstate">
            <option value="1">停用</option>
            <option value="0">启用</option>
        </select><br>&nbsp;
        <input  type="submit" value="确认添加">

    </form>
</center>
</body>
</html>
