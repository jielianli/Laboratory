<%@ page import="com.gy.Bean.Teacher" %><%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/5
  Time: 0:48
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
    <%
        Teacher t = (Teacher) request.getAttribute("t");
    %>
    <form action="teacherUpdate" method="post">
        <!--隐藏域，不给用户显示，但需要tid传参！-->
        <input type="hidden" name="tid" value="<%out.print(t.getTid());%>">

        教工号:<input type="text" name="tname" value="<%out.print(t.getTname());%>"><br>&nbsp;
        密码:<input type="text" name="tpass" value="<%out.print(t.getTpass());%>"><br> &nbsp;
        姓名:<input type="text" name="trueName" value="<%out.print(t.getTrueName());%>"><br> &nbsp;
        院系:<input type="text" name="tdepartment" value="<%out.print(t.getTdepartment());%>"><br> &nbsp;
        联系方式:<input type="text" name="contact" value="<%out.print(t.getContact());%>"><br>
        <input  type="submit" value="确认修改">
    </form>
</center>
</body>
</html>
