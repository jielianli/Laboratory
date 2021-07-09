<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/12
  Time: 17:04
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
    <form action="Reg" method="post" onsubmit="return reg()">
        <li><span><font>*</font> 教工号：</span><input type="text" name="tname" id="tname" class="txt"/></li>
        <li><span><font>*</font> 请设置密码：</span><input type="password" name="tpass" id="tpass" class="txt"/></li>
        <li><span><font>*</font> 请确认密码：</span><input type="password" name="tpass1" id="tpass1" class="txt"/></li>

        <input  type="submit" value="立即注册">
    </form>
</center>
</body>
<script type="text/javascript">
    function reg() {
        var a = document.getElementById("tpass").value;
        var b = document.getElementById("tpass1").value;
        var c = document.getElementById("tname").value;

        if (a != b) {
            alert("两次输入密码不一致,请重新输入");
            return false;
        }

        if (c.length<=8 ) {

        } else {
            alert("请注意格式 （年份+时间）<8位数,请重新输入");
            return false;
        }

        if (a.length >= 6) {

        } else {
            alert("密码不能小于6位，请重新输入");
            return false;
        }

    }
</script>
</html>
