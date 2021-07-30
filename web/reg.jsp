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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>网上实验室预约系统</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/home.css">
</head>
<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background-color: #20222A">
        <div class="layui-logo"
             style="background-color: #393D49;color: white;height: 210px;border-bottom: 1px solid white">
            <div style="background-color: #393D49;color: #f7f7f8;font-weight: bolder">网上实验室预约系统</div>
            <div style="font-size: 10px;text-align: center;height: 15px;margin-bottom: 8px;padding-right: 6px">
            </div>
            <div style="font-size: 10px;padding-right: 10px">
                注冊頁面
            </div>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="" id="refresh">
                <i class="layui-icon layui-icon-refresh"></i></a>
            </li>


            <li class="layui-nav-item"><a href="loginT.jsp" onclick="clearCookie()" id="logout"><i
                    class="layui-icon layui-icon-logout"></i>退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black" style="padding-top: 150px">
    </div>

    <div class="layui-body"
         style="background: url(img/uu.webp) no-repeat ;background-size: 100% 100%    ">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" >
            <form action="Reg" method="post" onsubmit="return reg()">
                <table  border="1"  style="width: 80%; height: 80%; margin-left:100px;">
                    <td><span><font>*</font> 教工号：</span></td>
                    <td>
                        <input type="text" name="tname" id="tname" class="txt"/>
                    </td>
                    </tr>
                    <tr>
                        <td><span><font>*</font> 请设置密码：</span></td>
                        <td>
                            <input type="password" name="tpass" id="tpass" class="txt"/>
                        </td>
                    </tr>
                    <tr>
                        <td><span><font>*</font> 请确认密码：</span></td>
                        <td>
                            <input type="password" name="tpass1" id="tpass1" class="txt"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input  type="submit" value="立即注册">
                        </td>
                    </tr>

            </table>
            </form>
        </div>


    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <div style="text-align: center">
            <!-- © 欢迎交流讨论 -->
        </div>
    </div>
</div>
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.js"></script>
<script src="js/home.js"></script>
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

<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
<div class="copyrights" id="links20210126">
</div>
</body>
</html>
