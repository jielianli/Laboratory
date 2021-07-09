<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/5
  Time: 0:03
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
        <form action="teacherAdd" method="post">
              教工号:<input type="text" name="tname" value="请注意格式"><br>&nbsp;
                密码:<input type="text" name="tpass" value=""><br> &nbsp;
                姓名:<input type="text" name="trueName" value=""><br> &nbsp;
               院系:<input type="text" name="tdepartment" value=""><br> &nbsp;
            联系方式:<input type="text" name="contact" value=""><br>
            <input  type="submit" value="确认添加">

        </form>
    </center>
    </body>

</html>
