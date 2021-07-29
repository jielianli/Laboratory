<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/13
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.gy.Dao.DBcoon" %>
<%@ page import="com.gy.Bean.Laboratory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background-color: #20222A">
        <div class="layui-logo"
             style="background-color: #393D49;color: white;height: 210px;border-bottom: 1px solid white">
            <div style="background-color: #393D49;color: #009E94;font-weight: bolder">网上实验室预约系统</div>
            <div style="font-size: 10px;text-align: center;height: 15px;margin-bottom: 8px;padding-right: 6px">
                ${sessionScope.nowteacher.trueName}
            </div>
            <div style="font-size: 10px;padding-right: 10px">
                欢迎使用本系统
            </div>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="#" id="refresh">
                <i class="layui-icon layui-icon-refresh"></i></a>
            </li>


            <li class="layui-nav-item"><a href="loginA.jsp" onclick="clearCookie()" id="logout"><i
                    class="layui-icon layui-icon-logout"></i>退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black" style="padding-top: 150px">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item" id="userManage" style="text-align: center">
                    <a href="teacher.jsp"  data-id="1" data-title="个人信息" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-username"></i>个人信息
                    </a>
                </li>
                <li class="layui-nav-item" id="dept" style="text-align: center">
                    <a href="LaboratoryT"  data-id="4" data-title="实验室" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-chart-screen"></i> 实验室
                    </a>
                </li>
                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-read"></i>课程管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="culumaddT.jsp" data-url="https://www.xxx.com/" data-id="10" data-title="添加课程"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 添加课程
                            </a>
                        </dd>
                        <dd>
                            <a href="culumT?tid="${nowteacher.tid} data-id="11" data-title="查看课程"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 查看课程
                            </a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item" id="class" style="text-align: center">
                    <a href="selectOrderT"  data-id="2" data-title="预约详情" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-read"></i> 预约详情
                    </a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body"
         style="background: url(img/uu.webp) no-repeat ;background-size: 100% 100%    ">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" style="">
            <ul class="layui-tab-title" style="background-color: rgba(255,255,255,0.1)">
                <li class="layui-this" lay-id="0"><i style="font-size: smaller"
                                                     class="layui-icon layui-icon-circle-dot"></i>首页
                </li>
            </ul>
        </div>

        <%
            Laboratory Laboratory = (Laboratory) request.getAttribute("lT");
        %>

        <form action="orderAddT" method="post" >
            <table  border="1"  style="width: 80%; height: 80%; margin-left:100px;">
                <tr>
                    <td>教学楼</td>
                    <td>
                        <input type="hidden"  name="tid" value="">
                        <input type="text" name="lbuilding" value="<%out.print(Laboratory.getLbuilding());%>">
                    </td>
                </tr>
                <tr>
                    <td> 教室:</td>
                    <td>
                        <input type="text" name="lclassroom" value="<%out.print(Laboratory.getLclassroom());%>">
                    </td>
                </tr>
                <tr>
                    <td>起始时间~~结束时间:</td>
                    <td>
                        <input type="hidden" name="orderDate" value="">
                        <input type="date" value="" name="starttime">
                        ~~
                        <input type="date" value="" name="endtime">
                    </td>
                </tr>
                <tr>
                    <td> 星期：</td>
                    <td>
                        <select name="cuweek" >
                            <option value="">请选择</option>
                            <option value="星期一">星期一</option>
                            <option value="星期二">星期二</option>
                            <option value="星期三">星期三</option>
                            <option value="星期四">星期四</option>
                            <option value="星期五">星期五</option>
                            <option value="星期六">星期六</option>
                            <option value="星期日">星期日</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td> 上课时间段：</td>
                    <td>
                        <select name="cusection">
                            <option value="" >请选择</option>
                            <option value="8：00~10：00">8：00~10：00</option>
                            <option value="10：00~12：00">10：00~12：00</option>
                            <option value="14：00~15：40">14：00~15：40</option>
                            <option value="16：00~17：40">16：00~17：40</option>
                            <option value="18：30~20：10">18：30~20：10</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>课程名字</td>
                    <td>
                        <select id="" name="cuname" style="width:180px;height:30px">
                            <option value="0" selected="selected">请选择课程</option>
                            <%
                                //连接数据库
                                Connection connection2 = null;
                                PreparedStatement preparedStatement2 = null;
                                ResultSet resultSet2 = null;
                                connection2= DBcoon.getcoon();
                                String sql2="SELECT cuname FROM curriculum ";
                                preparedStatement2 = connection2.prepareStatement(sql2);
                                resultSet2 = preparedStatement2.executeQuery();
                                while (resultSet2 != null && resultSet2.next()) {
                                    out.print("<option value="+resultSet2.getString(1)+">"+resultSet2.getString(1)+"</option>");
                                }
                            %></select>
                    </td>
                </tr>
                <tr>
                    <td>项目名称</td>
                    <td>
                        <input type="text" name="cuproject" value="">
                    </td>
                </tr>
                <tr>
                    <td>班级</td>
                    <td>
                        <input type="text" name="cuclass" value="">
                    </td>
                </tr>
                <tr>
                    <td>人数</td>
                    <td>
                        <input type="text" name="cunumber" value="">
                    </td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td>
                        <textarea name="cudescribe"  cols="30" rows="5"></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <input type="submit" value="提交">
                    </td>
                </tr>
            </table>
        </form>
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
<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
</body>
</html>
