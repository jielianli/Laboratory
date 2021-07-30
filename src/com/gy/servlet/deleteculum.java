package com.gy.servlet;

import com.gy.Dao.CulumDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：deleteculum
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/5 22:04
 * 版本：V1.0
 */
@WebServlet("/deleteculum")
public class deleteculum extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cuidStr=req.getParameter("cuid");
        int cuid=Integer.parseInt(cuidStr);

        CulumDao culumDao = new CulumDao();
        try {
            culumDao.delete(cuid);
            resp.sendRedirect("selectculum");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
