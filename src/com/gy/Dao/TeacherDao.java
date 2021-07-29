package com.gy.Dao;

import com.gy.Bean.Admin;
import com.gy.Bean.Page;
import com.gy.Bean.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 类名：TeacherDao
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/4 22:44
 * 版本：V1.0
 */
public class TeacherDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Teacher> selectAll() throws SQLException, ClassNotFoundException {
       List<Teacher> list=new ArrayList<>();
        connection = DBcoon.getcoon();
        String sql="select * from teacher";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Teacher teacher = new Teacher(resultSet.getInt("tid"),
                    resultSet.getString("tname"),
                    resultSet.getString("trueName"),
                    resultSet.getString("tpass"),
                    resultSet.getString("tdepartment"),
                    resultSet.getString("contact"));
            list.add(teacher);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }



    public List selectAllPage(Page page) throws SQLException, ClassNotFoundException {
        //2
        List<Teacher> list=new ArrayList<>();
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select * from teacher limit ?,?";
        preparedStatement=connection.prepareStatement(sql);
        //1-1*10=0  2-1*10=10从10后面取
        preparedStatement.setInt(1,(page.getPageNum()-1)*page.getPageSize());
        preparedStatement.setInt(2,page.getPageSize());
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Teacher teacher = new Teacher(resultSet.getInt("tid"),
                    resultSet.getString("tname"),
                    resultSet.getString("trueName"),
                    resultSet.getString("tpass"),
                    resultSet.getString("tdepartment"),
                    resultSet.getString("contact"));
            list.add(teacher);
        }
        //3
        return  list;
    }


    public int selectTotal() throws SQLException, ClassNotFoundException {
        //2
        int pageTotal=0;
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select count(*) as pageTotal from teacher";
        preparedStatement=connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet!=null&&resultSet.next()){
            pageTotal=resultSet.getInt("pageTotal");
        }
        //3
        return  pageTotal;
    }









    public Teacher selectByID(int tid) throws SQLException, ClassNotFoundException {
        Teacher teacher = new Teacher();
        connection = DBcoon.getcoon();
        String sql="select * from teacher where tid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,tid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
             teacher = new Teacher(resultSet.getInt("tid"),
                    resultSet.getString("tname"),
                    resultSet.getString("trueName"),
                    resultSet.getString("tpass"),
                    resultSet.getString("tdepartment"),
                    resultSet.getString("contact"));

        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return teacher;
    }



    //删除
    public  void  delete(int tid) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();
        String sql="delete from teacher where tid=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,tid);
        preparedStatement.executeUpdate();
        DBcoon.close(connection,preparedStatement,resultSet);
    }

    //    添加
    public  void  Add(Teacher teacher) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();

        String sql="insert into teacher values(null,?,?,?,?,?)";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,teacher.getTname());
        preparedStatement.setString(2,teacher.getTrueName());
        preparedStatement.setString(3,teacher.getTpass());
        preparedStatement.setString(4,teacher.getTdepartment());
        preparedStatement.setString(5,teacher.getContact());
        preparedStatement.executeUpdate();

        DBcoon.close(connection,preparedStatement,resultSet);
    }

    public  void  update(Teacher teacher) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();

        String sql="update  teacher set tname=?,trueName=?,tpass=?,tdepartment=?,contact=? where tid=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,teacher.getTname());
        preparedStatement.setString(2,teacher.getTrueName());
        preparedStatement.setString(3,teacher.getTpass());
        preparedStatement.setString(4,teacher.getTdepartment());
        preparedStatement.setString(5,teacher.getContact());
        preparedStatement.setInt(6,teacher.getTid());
        preparedStatement.executeUpdate();
        DBcoon.close(connection,preparedStatement,resultSet);
    }

    //教师登录！！
    public Teacher selectT(String tname,String tpass) throws SQLException, ClassNotFoundException {
        Teacher teacher = null;
        connection=DBcoon.getcoon();
        String sql = "select * from  teacher where tname=? and tpass=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, tname);
        preparedStatement.setString(2, tpass);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            teacher = new Teacher(resultSet.getInt("tid"),
                    resultSet.getString("tname"),
                    resultSet.getString("trueName"),
                    resultSet.getString("tpass"),
                    resultSet.getString("tdepartment"),
                    resultSet.getString("contact"));
        }
        DBcoon.close(connection,preparedStatement,resultSet);
        return teacher;
    }





}
