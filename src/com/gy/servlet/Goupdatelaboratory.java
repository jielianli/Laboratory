package com.gy.servlet;

import com.gy.Bean.Laboratory;
import com.gy.Dao.LaboratoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：Goupdatelaboratory
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/11 11:29
 * 版本：V1.0
 */
@WebServlet("/Goupdatelaboratory")
public class Goupdatelaboratory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String lidStr = req.getParameter("lid");
        int lid = Integer.parseInt(lidStr);


        System.out.println("111111111111111111"+lid);
        LaboratoryDao laboratoryDao = new LaboratoryDao();
        try {
            Laboratory laboratory = laboratoryDao.selectByID(lid);
            req.setAttribute("laboratory",laboratory);
            req.getRequestDispatcher("updatelaboratory.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
