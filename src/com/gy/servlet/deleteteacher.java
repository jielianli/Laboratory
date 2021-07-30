package com.gy.servlet;

import com.gy.Dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：deleteteacher
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 23:45
 * 版本：V1.0
 */
@WebServlet("/deleteteacher")
public class deleteteacher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tidStr=req.getParameter("tid");
        int tid=Integer.parseInt(tidStr);

        TeacherDao teacherDao=new TeacherDao();

        try {
            teacherDao.delete(tid);

            //重定向查询
            resp.sendRedirect("selectteacher");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
