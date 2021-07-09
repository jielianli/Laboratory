package com.gy.servlet;

import com.gy.Bean.Ordertable;
import com.gy.Dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：orderUpdate
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/11 23:03
 * 版本：V1.0
 */
@WebServlet("/orderUpdate")
public class orderUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oidStr=req.getParameter("oid");
        int oid=Integer.parseInt(oidStr);
        String tidStr=req.getParameter("tid");
        int tid=Integer.parseInt(tidStr);
        String lbuilding=req.getParameter("lbuilding");
        String lclassroom=req.getParameter("lclassroom");
        String orderDate=req.getParameter("orderDate");
        String starttime=req.getParameter("starttime");
        String endtime=req.getParameter("endtime");
        String cuweek=req.getParameter("cuweek");
        String cusection=req.getParameter("cusection");
        String cuname=req.getParameter("cuname");
        String cuproject=req.getParameter("cuproject");
        String cuclass=req.getParameter("cuclass");
        String cunumberStr=req.getParameter("cunumber");
        int  cunumber=Integer.parseInt(cunumberStr);
        String cudescribe=req.getParameter("cudescribe");
        String state=req.getParameter("state");

        Ordertable ordertable = new Ordertable(oid,tid,lbuilding,lclassroom,orderDate,starttime,
                endtime,cuweek,cusection,cuname,cuproject,cuclass,cunumber,cudescribe,state);

        OrderDao orderDao=new OrderDao();

        try {
            orderDao.update(ordertable);
            resp.sendRedirect("selectOrder");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
