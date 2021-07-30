package com.gy.servlet;

import com.gy.Bean.Curriculum;
import com.gy.Dao.CulumDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：Goupdateculum
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/5 22:21
 * 版本：V1.0
 */
@WebServlet("/Goupdateculum")
public class Goupdateculum extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cuidStr=req.getParameter("cuid");
        int cuid=Integer.parseInt(cuidStr);

        CulumDao culumDao = new CulumDao();

        try {
            Curriculum culum = culumDao.selectByID(cuid);
            req.setAttribute("culum",culum);
            req.getRequestDispatcher("updateculum.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
