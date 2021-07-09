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
    <base href="<%=basePath %>"/>
    <title>Title</title>
</head>
<body>
<center>
    <%
        Laboratory Laboratory = (Laboratory) request.getAttribute("lT");
    %>
    <form action="orderAddT" method="post">
        <input type="hidden"  name="tid" value="">
        教学楼:<input type="text" name="lbuilding" value="<%out.print(Laboratory.getLbuilding());%>">
        <br> &nbsp;
        教室:<input type="text" name="lclassroom" value="<%out.print(Laboratory.getLclassroom());%>">
        <br> &nbsp;
        <input type="hidden" name="orderDate" value=""><br> &nbsp;
        起始时间<input type="date" value="" name="starttime">
        ~~~
        结束时间：<input type="date" value="" name="endtime"><br> &nbsp;
        星期：
        <select name="cuweek" >
            <option value="">请选择</option>
            <option value="星期一">星期一</option>
            <option value="星期二">星期二</option>
            <option value="星期三">星期三</option>
            <option value="星期四">星期四</option>
            <option value="星期五">星期五</option>
            <option value="星期六">星期六</option>
            <option value="星期日">星期日</option>
        </select><br> &nbsp;
        上课时间段：
        <select name="cusection">
            <option value="" >请选择</option>
            <option value="8：00~10：00">8：00~10：00</option>
            <option value="10：00~12：00">10：00~12：00</option>
            <option value="14：00~15：40">14：00~15：40</option>
            <option value="16：00~17：40">16：00~17：40</option>
            <option value="18：30~20：10">18：30~20：10</option>
        </select><br> &nbsp;
        课程名字:
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
            %></select><br> &nbsp;
        项目名称:<input type="text" name="cuproject" value=""><br>&nbsp;
        班级:<input type="text" name="cuclass" value=""><br>&nbsp;
        人数:<input type="text" name="cunumber" value=""><br> &nbsp;
        描述:
        <textarea name="cudescribe"  cols="30" rows="5">
        </textarea><br>&nbsp;
        <input  type="submit" value="确认添加">
    </form>
</center>
</body>
</html>
