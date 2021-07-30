package com.gy.servlet;

import com.gy.Dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：deleteorder
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/11 22:50
 * 版本：V1.0
 */
@WebServlet("/deleteorder")
public class deleteorder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oidStr=req.getParameter("oid");
        int oid=Integer.parseInt(oidStr);

        OrderDao orderDao=new OrderDao();

        try {
            orderDao.delete(oid);
            //重定向查询
            resp.sendRedirect("selectOrder");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
