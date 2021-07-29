<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/12
  Time: 22:22
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
        <table style="width: 80%; height: 80%; margin-left:100px;" border="1" >
            <tr>
                <th>教学楼</th>
                <th>教室</th>
                <th>容纳人数</th>
                <th>是否空闲</th>
                <th>备注</th>
                <th>教室状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${sessionScope.laboratoryT}" var="list">
                <tr>
                    <td>${list.lbuilding}</td>
                    <td>${list.lclassroom}</td>
                    <td>${list.laccommodate}</td>
                    <td>
                        <c:if test="${list.lfree=='0'}">是</c:if>
                        <c:if test="${list.lfree=='1'}">否</c:if>
                    </td>
                    <td>${list.lremarks}</td>
                    <td>
                        <c:if test="${list.roomstate=='0'}">启用</c:if>
                        <c:if test="${list.roomstate=='1'}">停用</c:if>
                    </td>
                    <td>
                        <c:if test="${list.roomstate=='0'}">
                            实验室开启，可以预约！
                            <a href="GoorderT?lid=${list.lid}">点击预约</a>

                        </c:if>

                        <c:if test="${list.roomstate=='1'}">
                            该实验室已经关闭！
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td  colspan="8" style="text-align: center" >
                    <a href="LaboratoryT?pageNum=1">首页</a>
                    <a href="LaboratoryT?pageNum=${p.pageNum>1 ? (p.pageNum-1) : 1}">上一页</a>
                    <a href="LaboratoryT?pageNum=${p.pageNum<p.pageSum ? (p.pageNum+1) : p.pageSum}">下一页</a>
                    <a href="LaboratoryT?pageNum=${p.pageSum}">尾页</a>
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
