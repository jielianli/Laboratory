package com.gy.servlet;

import com.gy.Bean.Teacher;
import com.gy.Dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：Goupdateteacher
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/5 10:12
 * 版本：V1.0
 */
@WebServlet("/Goupdateteacher")
public class Goupdateteacher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tidStr=req.getParameter("tid");
        int tid=Integer.parseInt(tidStr);

        TeacherDao teacherDao = new TeacherDao();
        try {
            Teacher teacher = teacherDao.selectByID(tid);

            req.setAttribute("t",teacher);
            req.getRequestDispatcher("updateteacher.jsp").forward(req,resp);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
