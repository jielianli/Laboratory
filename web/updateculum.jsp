<%@ page import="com.gy.Bean.Curriculum" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.gy.Dao.DBcoon" %>
<%--

  Created by 劫恋李
  User: dell
  Date: 2021/5/5
  Time: 22:24
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
        <%
            Curriculum culum = (Curriculum) request.getAttribute("culum");
        %>
        <form action="culumUpdate" method="post" >
            <table  border="1"  style="width: 80%; height: 80%; margin-left:100px;">
                <tr>
                    <td>课程名</td>
                    <td>
                        <input type="hidden" name="cuid" value="<%out.print(culum.getCuid());%>">
                        <input type="text" name="cuname" value="<%out.print(culum.getCuname());%>">
                        <input type="hidden" name="tid" value="<%out.print(culum.getTid());%>">
                    </td>
                </tr>
                <tr>
                    <td>教室</td>
                    <td>
                        <select  name="cuclassroom" style="width:180px;height:30px">
                            <option value="<%out.print(culum.getCuclass());%>" selected="selected1"><%out.print(culum.getCuclass());%></option>
                            <%
                                //连接数据库
                                Connection connection1 = null;
                                PreparedStatement preparedStatement1 = null;
                                ResultSet resultSet1 = null;
                                connection1= DBcoon.getcoon();
                                String sql1="SELECT lclassroom FROM laboratory";
                                preparedStatement1 = connection1.prepareStatement(sql1);
                                resultSet1 = preparedStatement1.executeQuery();
                                while (resultSet1 != null && resultSet1.next()) {
                                    out.print("<option value="+resultSet1.getString(1)+">"+resultSet1.getString(1)+"</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>班级</td>
                    <td>
                        <input type="text" name="cuclass" value="<%out.print(culum.getCuclass());%>">
                    </td>
                </tr>

                <tr>
                    <td>负责教师</td>
                    <td>
                        <select id="" name="trueName" style="width:180px;height:30px">
                            <option value="<%out.print(culum.getTrueName());%>" selected="selected"><%out.print(culum.getTrueName());%></option>
                            <%
                                //连接数据库
                                Connection connection = null;
                                PreparedStatement preparedStatement = null;
                                ResultSet resultSet = null;
                                connection= DBcoon.getcoon();
                                String sql="SELECT trueName FROM teacher ";
                                preparedStatement = connection.prepareStatement(sql);
                                resultSet = preparedStatement.executeQuery();
                                while (resultSet != null && resultSet.next()) {
                                    out.print("<option value="+resultSet.getString(1)+">"+resultSet.getString(1)+"</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>起始时间~~结束时间:</td>
                    <td>
                        <input type="date" value="<%out.print(culum.getStarttime());%>" name="starttime">
                        ~~
                        <input type="date" value="<%out.print(culum.getEndtime());%>" name="endtime">
                    </td>
                </tr>
                <tr>
                    <td>星期</td>
                    <td>
                        <select name="cuweek" >
                            <option value="<%out.print(culum.getCuweek());%>"><%out.print(culum.getCuweek());%></option>
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
                    <td>上课时间段：</td>
                    <td>
                        <select name="cusection">
                            <option value="<%out.print(culum.getCusection());%>" ><%out.print(culum.getCusection());%></option>
                            <option value="8：00~10：00">8：00~10：00</option>
                            <option value="10：00~12：00">10：00~12：00</option>
                            <option value="14：00~15：40">14：00~15：40</option>
                            <option value="16：00~17：40">16：00~17：40</option>
                            <option value="18：30~20：10">18：30~20：10</option>
                        </select>
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
