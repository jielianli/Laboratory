<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.gy.Dao.DBcoon" %>
<%@ page import="com.gy.Bean.Ordertable" %>
<%--
  Created by 劫恋李
  User: dell
  Date: 2021/5/11
  Time: 22:55
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
    <%
        Ordertable ordertable = (Ordertable) request.getAttribute("Orderid");
    %>
    <form action="orderUpdate" method="post">
        <input type="hidden" name="oid" value="<%out.print(ordertable.getOid());%>"><br> &nbsp;
        <input type="hidden" name="tid" value="<%out.print(ordertable.getTid());%>"><br> &nbsp;
        教学楼:
        <select name="lbuilding" style="width:180px;height:30px">
            <option value="<%out.print(ordertable.getLbuilding());%>" selected="selected"><%out.print(ordertable.getLbuilding());%></option>
            <%
                //连接数据库
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
                connection= DBcoon.getcoon();
                String sql="SELECT lbuilding FROM laboratory ";
                preparedStatement = connection.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                while (resultSet != null && resultSet.next()) {
                    out.print("<option value="+resultSet.getString(1)+">"+resultSet.getString(1)+"</option>");
                }
            %>
        </select><br> &nbsp;
        教室:
        <select  name="lclassroom" style="width:180px;height:30px">
            <option value="<%out.print(ordertable.getLclassroom());%>" selected="selected1"><%out.print(ordertable.getLclassroom());%></option>
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
        </select><br> &nbsp;
        <input type="hidden" name="orderDate" value=""><br> &nbsp;
        起始时间<input type="date" value="<%out.print(ordertable.getStarttime());%>" name="starttime">
        ~~~
        结束时间：<input type="date" value="<%out.print(ordertable.getEndtime());%>" name="endtime"><br> &nbsp;
        星期：
        <select name="cuweek" >
            <option value="<%out.print(ordertable.getCuweek());%>"><%out.print(ordertable.getCuweek());%></option>
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
            <option value="<%out.print(ordertable.getCusection());%>" ><%out.print(ordertable.getCusection());%></option>
            <option value="8：00~10：00">8：00~10：00</option>
            <option value="10：00~12：00">10：00~12：00</option>
            <option value="14：00~15：40">14：00~15：40</option>
            <option value="16：00~17：40">16：00~17：40</option>
            <option value="18：30~20：10">18：30~20：10</option>
        </select><br> &nbsp;

        课程名字:
        <select id="" name="cuname" style="width:180px;height:30px">
            <option value="<%out.print(ordertable.getCuname());%>" selected="selected"><%out.print(ordertable.getCuname());%></option>
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
        项目名称:<input type="text" name="cuproject" value="<%out.print(ordertable.getCuproject());%>"><br>&nbsp;
        班级:<input type="text" name="cuclass" value="<%out.print(ordertable.getCuclass());%>"><br>&nbsp;
        人数:<input type="text" name="cunumber" value="<%out.print(ordertable.getCunumber());%>"><br> &nbsp;
        描述:
        <textarea name="cudescribe"  cols="30" rows="5">
            <%out.print(ordertable.getCudescribe());%>
        </textarea><br>&nbsp;
        预约状态：
        <select name="state">
            <option value="1">未同意预约请求</option>
            <option value="0">已同意预约请求</option>
        </select><br>&nbsp;
        <input  type="submit" value="确认修改">
    </form>
</center>
</body>
</html>
