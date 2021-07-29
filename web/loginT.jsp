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
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="css/login2.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="layui/layui.js" type="text/javascript"></script>
<h1 style="color: #6D9789">网上实验室预约系统</h1>

<div class="login" style="margin-top:50px;height: 320px;background-color: rgba(255,255,255,0.1); border-radius: 15px;">
    <div class="web_login" id="web_qr_login" style="display: block; height: 235px;">

        <!--登录-->
        <div class="web_login" id="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form  action="Login" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm"
                           method="post"><input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">名字：</label>
                            <div class="inputOuter" id="uArea">

                                <input type="text" id="u" name="tname" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">密码：</label>
                            <div class="inputOuter" id="pArea">

                                <input type="password" id="p" name="tpass" class="inputstyle"/>
                            </div>
                        </div>
                        <%--<div class="pwdArea" id="pwdAre">--%>
                        <%--<label class="input-tips" for="p">验证：</label>--%>
                        <%--<div class="inputOuter" id="pAre">--%>
                        <%--<input type="text" id="test" name="test" class="inputstyle" style="width: 120px"/>--%>
                        <%--<input type="button" id="checkCode" class="code" style="width:60px"--%>
                        <%--onclick="createCode()">--%>
                        <%--</div>--%>
                        <%--</div>--%>


                        <div style="padding-left:70px;margin-top:20px;">
                            <input type="submit" value="登 录" id="btn_login"
                                   style="width:150px;"
                                   class="button_blue"/></div>
                        <a href="reg.jsp">
                            <input style="width: 40px; margin-top: 18px;" type="button" value="注册">
                        </a>
                        <div style="padding-left:70px;margin-top:20px;">
                        <a href="loginA.jsp">
                            <input type="button" value="管理員登录頁面"
                                   style="width:150px;"
                                   class="button_blue"/>
                        </a>
                        </div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>
    <!--注册-->
</div>

<script>
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer,
            form = layui.form;
    });

    var code;

    // function createCode() {
    //     code = new Array();
    //     var codeLength = 4; //验证码的长度
    //     var checkCode = document.getElementById("checkCode");
    //     checkCode.value = "";
    //     var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
    //     for (var i = 0; i < codeLength; i++) {
    //         var charIndex = Math.floor(Math.random() * 32);
    //         code += selectChar[charIndex];
    //     }
    //     if (code.length != codeLength) {
    //         createCode();
    //     }
    //     checkCode.value = code;
    // }
    $("#rememberPwd").click(function () {
        var flag = $("#rememberPwd").is(':checked');
        if (flag) {
            layer.open({
                type: 1,
                title: '温馨提示',
                skin: 'layui-layer-molv',
                content: $("#tip"),
                btn: ['哦', '取消'],
                btnAlign: 'c',
                closeBtn: 0,
                anim:6,
                shadeClose: true,
                area: ['300px', '120px'],
                btn1: function () {
                    $("#rememberPwd").val("y");
                    layer.closeAll();
                },
                btn2: function () {
                    $("#rememberPwd").val("n");
                    layer.closeAll();
                    $("#rememberPwd").prop('checked',false);
                }
            },)
            // var remFlag = layer.confirm(
            //     '公共场所不建议记住密码，以防密码泄露，确认记住密码吗？',
            //     {icon: 3, anim: 6});
            // if (remFlag) {
            //     $("#rememberPwd").val("y");
            // } else {
            //     $("#rememberPwd").prop('checked',false);
            //     $("#rememberPwd").val("n");
            // }
        } else {
            $("#rememberPwd").val("n");
        }
    });


    $("#btn_login").click(function () {
        var username = $("#u").val();
        var pwd = $("#p").val();
        var rememberPwd = $("#rememberPwd").val();
        var input = $("#test").val();
        var checkCode = $("#checkCode").val().toLowerCase();

        if (username == "") {
            layer.msg('用户名不能为空！亲', {icon: 5, anim: 6})
        } else {
            if (pwd == "") {
                layer.msg('请填写密码！', {icon: 5, anim: 6})
            } else {
                if (input == "") {
                    layer.msg('验证码不能为空！', {icon: 5, anim: 6})
                } else {

                    if (input == checkCode) {
                        // layer.msg('<i class="layui-icon layui-icon-loading"></i>')
                        layer.load(0,{shade: false});
                        setTimeout(function () {
                            $.ajax({
                                type: 'post',
                                url: '/login',
                                data: {"userName": username, "pwd": pwd, "rememberPwd": rememberPwd},
                                success: function (data) {
                                    if (data == '登录成功') {
                                        layer.msg(data, {icon: 1, anim: 1});
                                        setTimeout(function () {
                                            location.href = "/toHomeByPwd"
                                        }, 1000)
                                    } else {
                                        layer.msg(data, {icon: 5, anim: 6});
                                    }
                                },
                                error: function () {
                                    layer.msg('执行失败');
                                }

                            });
                        }, 500);
                    } else {
                        layer.msg('验证码输入有误！', {icon: 5, anim: 6});
                        createCode();
                    }
                }
            }
        }
    });
    $(function () {
        $("#checkCode").value(createCode());
    })
</script>
</body>
</html>
