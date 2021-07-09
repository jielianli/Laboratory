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
import java.util.List;

/**
 * 类名：selectOrderT
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/13 14:44
 * 版本：V1.0
 */
@WebServlet("/selectOrderT")
public class selectOrderT extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Teacher teacher=(Teacher) session.getAttribute("nowteacher");

        OrderDao orderDao=new OrderDao();
        try {
            //调用查询方法
            List<Ordertable> list = orderDao.selectL(teacher.getTid());

            System.out.println("111"+list);
            //把集合存入request，转发到页面可以取出来
            req.setAttribute("orderlist",list);
            //转到jsp,固定方法getRequestDispatcher
            req.getRequestDispatcher("orderallT.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
