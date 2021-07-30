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
 * 类名：teacherUpdate
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/5 10:23
 * 版本：V1.0
 */
@WebServlet("/teacherUpdate")
public class teacherUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String tidStr=req.getParameter("tid");
        int  tid=Integer.parseInt(tidStr);
        String tname=req.getParameter("tname");
        String tpass=req.getParameter("tpass");
        String trueName=req.getParameter("trueName");
        String tdepartment=req.getParameter("tdepartment");
        String contact=req.getParameter("contact");

        Teacher teacher=new Teacher(tid,tname,trueName,tpass,tdepartment,contact);


        System.out.println("1@@@@@@@@@"+teacher);
        TeacherDao teacherDao=new TeacherDao();

        try {

            teacherDao.update(teacher);
            resp.sendRedirect("selectteacher");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
