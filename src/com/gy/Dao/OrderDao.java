package com.gy.Dao;

import com.gy.Bean.Ordertable;
import com.gy.Bean.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 类名：OrderDao
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/7 11:14
 * 版本：V1.0
 */
public class OrderDao {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public List<Ordertable> selectAll() throws SQLException, ClassNotFoundException {
        List<Ordertable> list=new ArrayList<>();
        connection = DBcoon.getcoon();
        String sql="select * from ordertable";
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Ordertable ordertable = new Ordertable(
                    resultSet.getInt("oid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getString("orderDate"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuproject"),
                    resultSet.getString("cuclass"),
                    resultSet.getInt("cunumber"),
                    resultSet.getString("cudescribe"),
                    resultSet.getString("state")
            );
            list.add(ordertable);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }


    public List selectAllPage(Page page) throws SQLException, ClassNotFoundException {
        //2
        List<Ordertable> list=new ArrayList<>();
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select * from ordertable limit ?,?";

        preparedStatement=connection.prepareStatement(sql);
        //1-1*10=0  2-1*10=10从10后面取
        preparedStatement.setInt(1,(page.getPageNum()-1)*page.getPageSize());
        preparedStatement.setInt(2,page.getPageSize());
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Ordertable ordertable = new Ordertable(
                    resultSet.getInt("oid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getString("orderDate"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuproject"),
                    resultSet.getString("cuclass"),
                    resultSet.getInt("cunumber"),
                    resultSet.getString("cudescribe"),
                    resultSet.getString("state")
            );
            list.add(ordertable);
        }
        //3
        return  list;
    }


    public int selectTotal() throws SQLException, ClassNotFoundException {
        //2
        int pageTotal=0;
        connection =DBcoon.getcoon();
        //偏移量
        String sql="select count(*) as pageTotal from ordertable";
        preparedStatement=connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet!=null&&resultSet.next()){
            pageTotal=resultSet.getInt("pageTotal");
        }
        //3
        return  pageTotal;
    }


    public Ordertable selectByID(int oid) throws SQLException, ClassNotFoundException {
        Ordertable ordertable = new Ordertable();
        connection = DBcoon.getcoon();
        String sql="select * from ordertable where oid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,oid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
             ordertable = new Ordertable(
                     resultSet.getInt("oid"),
                     resultSet.getInt("tid"),
                     resultSet.getString("lbuilding"),
                     resultSet.getString("lclassroom"),
                     resultSet.getString("orderDate"),
                     resultSet.getString("starttime"),
                     resultSet.getString("endtime"),
                     resultSet.getString("cuweek"),
                     resultSet.getString("cusection"),
                     resultSet.getString("cuname"),
                     resultSet.getString("cuproject"),
                     resultSet.getString("cuclass"),
                     resultSet.getInt("cunumber"),
                     resultSet.getString("cudescribe"),
                     resultSet.getString("state")
             );

        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return ordertable;
    }



    //删除
    public  void  delete(int oid) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();
        String sql="delete from ordertable where oid=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,oid);
        preparedStatement.executeUpdate();
        DBcoon.close(connection,preparedStatement,resultSet);
    }

    //    添加
    public  void  Add(Ordertable ordertable) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();

        String sql="insert into ordertable values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,ordertable.getTid());
        preparedStatement.setString(2,ordertable.getLbuilding());
        preparedStatement.setString(3,ordertable.getLclassroom());
        preparedStatement.setString(4,ordertable.getOrderDate());
        preparedStatement.setString(5,ordertable.getStarttime());
        preparedStatement.setString(6,ordertable.getEndtime());
        preparedStatement.setString(7,ordertable.getCuweek());
        preparedStatement.setString(8,ordertable.getCusection());
        preparedStatement.setString(9,ordertable.getCuname());
        preparedStatement.setString(10,ordertable.getCuproject());
        preparedStatement.setString(11,ordertable.getCuclass());
        preparedStatement.setInt(12,ordertable.getCunumber());
        preparedStatement.setString(13,ordertable.getDescribe());
        preparedStatement.setString(14,ordertable.getState());

        preparedStatement.executeUpdate();

        DBcoon.close(connection,preparedStatement,resultSet);
    }
    //修改商品
    public  void  update(Ordertable ordertable) throws SQLException, ClassNotFoundException {
        //·1获取连接
        connection=DBcoon.getcoon();

        String sql="update  ordertable set   tid=?, lbuilding=?,lclassroom=?,orderDate=?,starttime=?,endtime=? ,cuweek=?,cusection=?,cuname=? ,cuproject=?, cuclass=?, cunumber=?,cudescribe=? ,state=?  where oid=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,ordertable.getTid());
        preparedStatement.setString(2,ordertable.getLbuilding());
        preparedStatement.setString(3,ordertable.getLclassroom());
        preparedStatement.setString(4,ordertable.getOrderDate());
        preparedStatement.setString(5,ordertable.getStarttime());
        preparedStatement.setString(6,ordertable.getEndtime());
        preparedStatement.setString(7,ordertable.getCuweek());
        preparedStatement.setString(8,ordertable.getCusection());
        preparedStatement.setString(9,ordertable.getCuname());
        preparedStatement.setString(10,ordertable.getCuproject());
        preparedStatement.setString(11,ordertable.getCuclass());
        preparedStatement.setInt(12,ordertable.getCunumber());
        preparedStatement.setString(13,ordertable.getDescribe());
        preparedStatement.setString(14,ordertable.getState());
        preparedStatement.setInt(15,ordertable.getOid());
        preparedStatement.executeUpdate();
        DBcoon.close(connection,preparedStatement,resultSet);
    }
    public List<Ordertable> selectL(int tid) throws SQLException, ClassNotFoundException {
        List<Ordertable> list=new ArrayList<Ordertable>();
        connection = DBcoon.getcoon();
        String sql="select * from ordertable where tid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, tid);
        resultSet = preparedStatement.executeQuery();
        while (resultSet != null && resultSet.next()) {
            Ordertable ordertable = new Ordertable(
                    resultSet.getInt("oid"),
                    resultSet.getInt("tid"),
                    resultSet.getString("lbuilding"),
                    resultSet.getString("lclassroom"),
                    resultSet.getString("orderDate"),
                    resultSet.getString("starttime"),
                    resultSet.getString("endtime"),
                    resultSet.getString("cuweek"),
                    resultSet.getString("cusection"),
                    resultSet.getString("cuname"),
                    resultSet.getString("cuproject"),
                    resultSet.getString("cuclass"),
                    resultSet.getInt("cunumber"),
                    resultSet.getString("cudescribe"),
                    resultSet.getString("state")
            );
            list.add(ordertable);
        }
        DBcoon.close(connection, preparedStatement, resultSet);
        return list;
    }

}
