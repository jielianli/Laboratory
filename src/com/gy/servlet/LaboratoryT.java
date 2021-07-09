package com.gy.servlet;

import com.gy.Bean.Laboratory;
import com.gy.Dao.LaboratoryDao;

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
 * 类名：Laboratory
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/12 22:16
 * 版本：V1.0
 */
@WebServlet("/LaboratoryT")
public class LaboratoryT extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LaboratoryDao laboratoryDao=new LaboratoryDao();
        try {
            //调用查询方法
            List<Laboratory> list = laboratoryDao.selectL();

            System.out.println("111"+list);
            //把集合存入request，转发到页面可以取出来
//            req.setAttribute("laboratory",list);

            HttpSession session = req.getSession();
            //使用session封装起来，以便之后取。
            session.setAttribute("laboratoryT", list);
            req.getRequestDispatcher("laboratoryT.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
