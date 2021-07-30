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
import java.util.concurrent.ThreadPoolExecutor;

/**
 * 类名：culumUpdate
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/5 22:48
 * 版本：V1.0
 */
@WebServlet("/culumUpdate")
public class culumUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tidStr=req.getParameter("tid");
        int tid=Integer.parseInt(tidStr);
        String cuname=req.getParameter("cuname");
        String cuclass=req.getParameter("cuclass");
        String cuclassroom=req.getParameter("cuclassroom");
        String trueName=req.getParameter("trueName");
        String starttime=req.getParameter("starttime");
        String endtime=req.getParameter("endtime");
        String cuweek=req.getParameter("cuweek");
        String cusection=req.getParameter("cusection");
        String cuidStr=req.getParameter("cuid");
        int cuid=Integer.parseInt(cuidStr);

        Curriculum curriculum=new Curriculum(cuid,tid,cuname,cuclassroom,cuclass,trueName,starttime,endtime,cuweek,cusection);

        System.out.println("#########3"+curriculum);
        CulumDao culumDao = new CulumDao();
        try {
            culumDao.update(curriculum);

            resp.sendRedirect("selectculum");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
