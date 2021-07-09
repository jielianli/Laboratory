<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.gy.Dao.DBcoon" %>
<%@ page import="com.gy.Bean.Teacher" %><%--
  Created by 王金星
  User: dell
  Date: 2021/5/5
  Time: 18:40
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
    <form action="culumAddT" method="post">
        <input type="hidden" name="tid" value=""><!--隐藏域，传值但不需要填写-->
        课程名:<input type="text" name="cuname" value=""><br>&nbsp;
        教室:
        <select  name="cuclassroom" style="width:180px;height:30px">
            <option value="0" selected="selected1">请选择教室</option>
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
        班级:<input type="text" name="cuclass" value=""><br> &nbsp;
        负责教师：
        <select id="" name="trueName" style="width:180px;height:30px">
            <option value="0" selected="selected">请选择负责教师</option>
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
        </select><br> &nbsp;

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
        <input  type="submit" value="确认添加">

    </form>
</center>
</body>
</html>
