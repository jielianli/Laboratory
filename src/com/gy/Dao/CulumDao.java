package com.gy.Dao;

import com.gy.Bean.Curriculum;
import com.gy.Bean.Page;

import javax.print.attribute.SetOfIntegerSyntax;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 类名：CulumDao
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/5 13:28
 * 版本：V1.0
 */
public class CulumDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Curriculum> selectAll() throws SQLException, ClassNotFoundException {
        List<Curriculum> list = new ArrayList<>();
        connection = DBcoon.getcoon();
        String sql = "select * from curriculum";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Curriculum curriculum = new Curriculum(resultSet.getInt("cuid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuclassroom"),
                    resultSet.getString("cuclass"),
                    resultSet.getString("trueName"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"));
            list.add(curriculum);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }


    public List selectAllPage(Page page) throws SQLException, ClassNotFoundException {
        //2
        List<Curriculum> list=new ArrayList<Curriculum>();
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select * from curriculum limit ?,?";

        preparedStatement=connection.prepareStatement(sql);
        //1-1*10=0  2-1*10=10从10后面取
        preparedStatement.setInt(1,(page.getPageNum()-1)*page.getPageSize());
        preparedStatement.setInt(2,page.getPageSize());
        resultSet = preparedStatement.executeQuery();

        while (resultSet!=null&&resultSet.next()){
            Curriculum curriculum = new Curriculum(resultSet.getInt("cuid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuclassroom"),
                    resultSet.getString("cuclass"),
                    resultSet.getString("trueName"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"));
            list.add(curriculum);
        }
        //3
        return  list;
    }


    public int selectTotal() throws SQLException, ClassNotFoundException {
        //2
        int pageTotal=0;
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select count(*) as pageTotal from curriculum";
        preparedStatement=connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet!=null&&resultSet.next()){
            pageTotal=resultSet.getInt("pageTotal");
        }
        //3
        return  pageTotal;
    }





    public Curriculum selectByID(int cuid) throws SQLException, ClassNotFoundException {
        Curriculum curriculum = new Curriculum();
        connection = DBcoon.getcoon();
        String sql = "select * from curriculum where cuid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, cuid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            curriculum = new Curriculum(resultSet.getInt("cuid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuclassroom"),
                    resultSet.getString("cuclass"),
                    resultSet.getString("trueName"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"));

        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return curriculum;
    }


    //删除
    public void delete(int cuid) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection = DBcoon.getcoon();
        String sql = "delete from curriculum where cuid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, cuid);
        preparedStatement.executeUpdate();
        DBcoon.close(connection, preparedStatement, resultSet);
    }

    //    添加
    public void Add(Curriculum curriculum) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection = DBcoon.getcoon();

        String sql = "insert into curriculum values(null,?,?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,curriculum.getTid());
        preparedStatement.setString(2, curriculum.getCuname());
        preparedStatement.setString(3, curriculum.getCuclassroom());
        preparedStatement.setString(4, curriculum.getCuclass());
        preparedStatement.setString(5, curriculum.getTrueName());
        preparedStatement.setString(6, curriculum.getStarttime());
        preparedStatement.setString(7, curriculum.getEndtime());
        preparedStatement.setString(8, curriculum.getCuweek());
        preparedStatement.setString(9, curriculum.getCusection());
        preparedStatement.executeUpdate();

        DBcoon.close(connection, preparedStatement, resultSet);
    }

    //修改
    public void update(Curriculum curriculum) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection = DBcoon.getcoon();

        String sql = "update  curriculum set cuname=?, tid =?,cuclassroom=?,cuclass=?, trueName=?,starttime=?,endtime=? ,cuweek=?,cusection=? where cuid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, curriculum.getCuname());
        preparedStatement.setInt(2,curriculum.getTid());
        preparedStatement.setString(3, curriculum.getCuclassroom());
        preparedStatement.setString(4, curriculum.getCuclass());
        preparedStatement.setString(5, curriculum.getTrueName());
        preparedStatement.setString(6, curriculum.getStarttime());
        preparedStatement.setString(7, curriculum.getEndtime());
        preparedStatement.setString(8, curriculum.getCuweek());
        preparedStatement.setString(9, curriculum.getCusection());
        preparedStatement.setInt(10, curriculum.getCuid());
        preparedStatement.executeUpdate();
        DBcoon.close(connection, preparedStatement, resultSet);
    }


    //通过tid查询，教师专用
    public List<Curriculum> selectC(int tid) throws SQLException, ClassNotFoundException {
        List<Curriculum> list=new ArrayList<Curriculum>();
        connection = DBcoon.getcoon();
        String sql = "select * from curriculum where tid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, tid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Curriculum   curriculum = new Curriculum(resultSet.getInt("cuid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuclassroom"),
                    resultSet.getString("cuclass"),
                    resultSet.getString("trueName"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"));
            list.add(curriculum);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }

}
