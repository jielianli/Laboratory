package com.gy.Dao;

import com.gy.Bean.Laboratory;
import com.gy.Bean.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 类名：LaboratoryDao
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/7 10:25
 * 版本：V1.0
 */
public class LaboratoryDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;


    public List<Laboratory> selectAll() throws SQLException, ClassNotFoundException {
        List<Laboratory> list=new ArrayList<Laboratory>();
        connection = DBcoon.getcoon();
        String sql="select * from laboratory";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Laboratory laboratory = new Laboratory(resultSet.getInt("lid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getInt("laccommodate"),
                    resultSet.getString("lfree"),
                    resultSet.getString("lremarks"),
                    resultSet.getString("roomstate")
            );
            list.add(laboratory);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }


    public List selectAllPage(Page page) throws SQLException, ClassNotFoundException {
        //2
        List<Laboratory> list=new ArrayList<Laboratory>();
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select * from laboratory limit ?,?";

        preparedStatement=connection.prepareStatement(sql);
        //1-1*10=0  2-1*10=10从10后面取
        preparedStatement.setInt(1,(page.getPageNum()-1)*page.getPageSize());
        preparedStatement.setInt(2,page.getPageSize());
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Laboratory laboratory = new Laboratory(resultSet.getInt("lid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getInt("laccommodate"),
                    resultSet.getString("lfree"),
                    resultSet.getString("lremarks"),
                    resultSet.getString("roomstate")
            );
            list.add(laboratory);
        }
        //3
        return  list;
    }


    public int selectTotal() throws SQLException, ClassNotFoundException {
        //2
        int pageTotal=0;
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select count(*) as pageTotal from laboratory";
        preparedStatement=connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet!=null&&resultSet.next()){
            pageTotal=resultSet.getInt("pageTotal");
        }
        //3
        return  pageTotal;
    }






    public Laboratory selectByID(int lid) throws SQLException, ClassNotFoundException {
        Laboratory laboratory = new Laboratory();
        connection = DBcoon.getcoon();
        String sql="select * from laboratory where lid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,lid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
             laboratory = new Laboratory(resultSet.getInt("lid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getInt("laccommodate"),
                    resultSet.getString("lfree"),
                    resultSet.getString("lremarks"),
                    resultSet.getString("roomstate")
            );

        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return laboratory;
    }



    //删除
    public  void  delete(int lid) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();
        String sql="delete from laboratory where lid=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,lid);
        preparedStatement.executeUpdate();
        DBcoon.close(connection,preparedStatement,resultSet);
    }

    //    添加
    public  void  Add(Laboratory laboratory) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();

        String sql="insert into laboratory values(null,?,?,?,?,?,?)";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,laboratory.getLbuilding());
        preparedStatement.setString(2,laboratory.getLclassroom());
        preparedStatement.setInt(3,laboratory.getLaccommodate());
        preparedStatement.setString(4,laboratory.getLfree());
        preparedStatement.setString(5,laboratory.getLremarks());
        preparedStatement.setString(6,laboratory.getRoomstate());
        preparedStatement.executeUpdate();

        DBcoon.close(connection,preparedStatement,resultSet);
    }
    //修改商品
    public  void  update(Laboratory laboratory) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();

        String sql="update  laboratory set lbuilding=?,lclassroom=?,laccommodate=?,lfree=?,lremarks=?,roomstate=? where lid=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,laboratory.getLbuilding());
        preparedStatement.setString(2,laboratory.getLclassroom());
        preparedStatement.setInt(3,laboratory.getLaccommodate());
        preparedStatement.setString(4,laboratory.getLfree());
        preparedStatement.setString(5,laboratory.getLremarks());
        preparedStatement.setString(6,laboratory.getRoomstate());
        preparedStatement.setInt(7,laboratory.getLid());
        preparedStatement.executeUpdate();
        DBcoon.close(connection,preparedStatement,resultSet);
    }

    //查询出空闲的实验室
    public List<Laboratory> selectL() throws SQLException, ClassNotFoundException {
        List<Laboratory> list=new ArrayList<Laboratory>();
        connection = DBcoon.getcoon();
        String sql="select * from laboratory WHERE lfree='0'";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Laboratory laboratory = new Laboratory(resultSet.getInt("lid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getInt("laccommodate"),
                    resultSet.getString("lfree"),
                    resultSet.getString("lremarks"),
                    resultSet.getString("roomstate")
            );
            list.add(laboratory);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }


}
