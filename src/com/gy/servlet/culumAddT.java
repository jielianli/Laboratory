package com.gy.servlet;

import com.gy.Bean.Curriculum;
import com.gy.Bean.Teacher;
import com.gy.Dao.CulumDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 类名：culumAdd
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/5 20:31
 * 版本：V1.0
 */
@WebServlet("/culumAddT")
public class culumAddT extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Teacher teacher=(Teacher) session.getAttribute("nowteacher");

        String cuname=req.getParameter("cuname");
        String cuclassroom=req.getParameter("cuclassroom");
        String cuclass=req.getParameter("cuclass");
        String trueName=req.getParameter("trueName");

        String starttime=req.getParameter("starttime");
        String endtime=req.getParameter("endtime");
        String cuweek=req.getParameter("cuweek");
        String cusection=req.getParameter("cusection");

        System.out.println("1111"+cuname);

        Curriculum curriculum = new Curriculum(0,teacher.getTid(),cuname,cuclassroom,cuclass,trueName,starttime,endtime,cuweek,cusection);

        CulumDao culumDao = new CulumDao();

        try {
            culumDao.Add(curriculum);
            resp.sendRedirect("culumT");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
