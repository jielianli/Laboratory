package com.gy.servlet;

import com.gy.Bean.Ordertable;
import com.gy.Bean.Teacher;
import com.gy.Dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

/**
 * 类名：orderAddT
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/13 14:34
 * 版本：V1.0
 */
@WebServlet("/orderAddT")
public class orderAddT extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Teacher teacher=(Teacher) session.getAttribute("nowteacher");
        String lbuilding=req.getParameter("lbuilding");
        String lclassroom=req.getParameter("lclassroom");
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

        Date date = new Date();
        Ordertable ordertable = new Ordertable(0, teacher.getTid(),lbuilding,lclassroom,date.toLocaleString(),starttime,endtime,cuweek,cusection,cuname,cuproject,cuclass,cunumber,cudescribe,"1");


        OrderDao orderDao=new OrderDao();
        try {
            orderDao.Add(ordertable);
            resp.sendRedirect("selectOrderT");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
