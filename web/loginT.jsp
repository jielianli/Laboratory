<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/12
  Time: 12:24
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
            var a = document.getElementById("tname").value;
            var b = document.getElementById("tpass").value;
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
<form action="Login" method="post" class="form" onsubmit="return login()">
    <input type="text" value="账户名" name="tname" class="txt" onfocus="if(value=='账户名') {value=''}" onblur="if(value=='') {value='账户名'}"/><br>&nbsp;
    <input type="password" value="密码" name="tpass" onfocus="if(value=='密码') {value=''}" onblur="if(value=='') {value='密码'}"/><br>&nbsp;
    <a href="reg.jsp" >注册</a>&nbsp;<input type="submit" value="立即登陆" class="sub"/>
</form>
</center>
</body>
</html>
