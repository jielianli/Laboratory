<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/8
  Time: 18:04
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
        <table style="width: 100%; height: 80%;" border="1" >
            <tr>
                <th>教学楼</th>
                <th>教室</th>
                <th>预约时间</th>
                <th>开始日期</th>
                <th>结束日期</th>
                <th>星期</th>
                <th>上课时间段</th>
                <th>课程名字</th>
                <th>项目名称</th>
                <th>班级</th>
                <th>人数</th>
                <th>描述</th>
                <th>预约状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.orderlist}" var="list">
                <tr>
                    <td>${list.lbuilding}</td>
                    <td>${list.lclassroom}</td>
                    <td>${list.orderDate}</td>
                    <td>${list.starttime}</td>
                    <td>${list.endtime}</td>
                    <td>${list.cuweek}</td>
                    <td>${list.cusection}</td>
                    <td>${list.cuname}</td>
                    <td>${list.cuproject}</td>
                    <td>${list.cuclass}</td>
                    <td>${list.cunumber}</td>
                    <td>${list.cudescribe}</td>
                    <td>
                        <c:if test="${list.state=='1'}">未同意预约请求</c:if>
                        <c:if test="${list.state=='0'}">已同意预约请求</c:if>
                    </td>
                    <  <td>
                    <a href="deleteorder?oid=${list.oid}" onclick="return window.confirm('是否取消预约？')">取消预约</a>
                </td>
                </tr>
            </c:forEach>
        </table>
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
