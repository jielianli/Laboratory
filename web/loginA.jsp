<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/4
  Time: 15:45
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
    <script type="text/javascript">
        function login() {
            var a = document.getElementById("aname").value;
            var b = document.getElementById("apass").value;
            if (a != ) {
            } else {
                alert("用户名错误,请重新输入");
                return false;
            }
            if (b != ) {
            } else {
                alert("密码错误，请重新输入");
                return false;
            }
        }
    </script>
</head>
<body>
    <center>
        <form method="post" action="LoginA" onsubmit="return login()">
            <input type="text" value="账户名" name="aname" class="txt" onfocus="if(value=='账户名') {value=''}" onblur="if(value=='') {value='账户名'}"/><br>&nbsp;
            <input type="password" value="密码" name="apass" class="txt" onfocus="if(value=='密码') {value=''}" onblur="if(value=='') {value='密码'}"/><br>&nbsp;
            <input type="submit" value="登录">
        </form>

    </center>

</body>
</html>
