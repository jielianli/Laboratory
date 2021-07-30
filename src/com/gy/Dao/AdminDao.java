package com.gy.Dao;

import com.gy.Bean.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 类名：AdminDao
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 16:00
 * 版本：V1.0
 */
public class AdminDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Admin select(String aname, String apass) throws SQLException, ClassNotFoundException {
        Admin admin = null;
        connection = DBcoon.getcoon();
        String sql="select * from admin where aname=? and apass=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, aname);
        preparedStatement.setString(2, apass);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            admin = new Admin(resultSet.getInt("aid"),
                    resultSet.getString("aname"),
                    resultSet.getString("apass"));
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return admin;
    }
}
