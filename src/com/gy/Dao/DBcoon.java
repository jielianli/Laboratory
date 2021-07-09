package com.gy.Dao;

import java.sql.*;

/**
 * 类名：DBcoon
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/4 0:25
 * 版本：V1.0
 */
public class DBcoon {

    public static  String DRIVER="com.mysql.jdbc.Driver";
    public static  String URL="jdbc:mysql://localhost:3306/wjx?characterEncoding=utf-8";
    public static  String USERNAME="root";
    public static  String PASSWORD="root";

    //获取数据库连接方法
    //二
    public static Connection getcoon() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        System.out.println("1.加载数据库成功！！");

        Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        System.out.println("2.连接数据库成功！！");
        return connection;

    }

    //三  关闭数据库
    public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {

        if(resultSet!=null){
            resultSet.close();
            System.out.println("resultSet关闭成功");

        }
        if(preparedStatement!=null){
            preparedStatement.close();
            System.out.println("preparedStatement关闭成功");
        }


        if(connection!=null){
            connection.close();
            System.out.println("connection关闭成功");
        }
    }
}
