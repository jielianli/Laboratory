package com.gy.servlet;

import com.gy.Dao.LaboratoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：deletelaboratory
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/11 11:21
 * 版本：V1.0
 */
@WebServlet("/deletelaboratory")
public class deletelaboratory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lidStr = req.getParameter("lid");
        int lid = Integer.parseInt(lidStr);

        LaboratoryDao laboratoryDao = new LaboratoryDao();
        try {
            laboratoryDao.delete(lid);
            resp.sendRedirect("selectLaborad");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
