<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/4
  Time: 22:52
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
                欢迎,"${sessionScope.nowadmin.aname}"
            </div>
            <div style="font-size: 10px;padding-right: 10px">
                登录本系统
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

                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-username"></i>教师信息</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="teacheradd.jsp"   data-id="10" data-title="添加教师"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 添加教师
                            </a>
                        </dd>
                        <dd>
                            <a href="selectteacher"  data-id="11" data-title="查看教师"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 查看教师
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-read"></i>课程管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="culumadd.jsp" data-url="https://www.xxx.com/" data-id="10" data-title="添加课程"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 添加课程
                            </a>
                        </dd>
                        <dd>
                            <a href="selectculum" data-url="https://www.xxx.com/" data-id="11" data-title="查看课程"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 查看课程
                            </a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-table"></i> 实验室管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="selectLaborad" data-url="https://www.xxx.com/" data-id="7" data-title="实验室详情"
                               class="site-demo-active">
                            <i class="layui-icon layui-icon-table"></i> 实验室详情
                        </a>
                        </dd>
                        <dd>
                            <a href="laboratoryadd.jsp" data-url="https://www.xxx.com/" data-id="8" data-title="添加实验室"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 添加实验室
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-chart-screen"></i>预约管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="orderadd.jsp" data-url="https://www.xxx.com/" data-id="10" data-title="添加预约"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 添加预约
                            </a>
                        </dd>
                        <dd>
                            <a href="selectOrder" data-url="https://www.xxx.com/" data-id="11" data-title="查看预约"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 查看预约
                            </a>
                        </dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body"
         style="background: url(img/bodyBg.jpg) no-repeat ;background-size: 100% 100%    ">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" style="">
            <ul class="layui-tab-title" style="background-color: rgba(255,255,255,0.1)">
                <li class="layui-this" lay-id="0"><i style="font-size: smaller"
                                                     class="layui-icon layui-icon-circle-dot"></i>首页
                </li>
            </ul>
        </div>
        <table style="width: 80%; height: 80%; margin-left:100px;" border="1" >
            <tr>
                <th>教工号</th>
                <th>密码</th>
                <th>姓名</th>
                <th>院系</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.teacherlist}" var="list">
                <tr>
                    <td>${list.tname}</td>
                    <td>${list.tpass}</td>
                    <td>${list.trueName}</td>
                    <td>${list.tdepartment}</td>
                    <td>${list.contact}</td>
                    <td>
                        <a href="Goupdateteacher?tid=${list.tid}">修改</a>&nbsp;
                        <a href="deleteteacher?tid=${list.tid}"  onclick="return window.confirm('是否确定删除？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td  colspan="8" style="text-align: center" >
                    <a href="selectteacher?pageNum=1">首页</a>
                    <a href="selectteacher?pageNum=${p.pageNum>1 ? (p.pageNum-1) : 1}">上一页</a>
                    <a href="selectteacher?pageNum=${p.pageNum<p.pageSum ? (p.pageNum+1) : p.pageSum}">下一页</a>
                    <a href="selectteacher?pageNum=${p.pageSum}">尾页</a>
                    当前${p.pageNum}页 共 ${p.pageSum}页 共${p.pageTotal}条
                </td>
            </tr>
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
