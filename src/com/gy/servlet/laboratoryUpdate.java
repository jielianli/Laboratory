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
 * 类名：laboratoryUpdate
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/11 13:31
 * 版本：V1.0
 */
@WebServlet("/laboratoryUpdate")
public class laboratoryUpdate  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String lidStr=req.getParameter("lid");
        int lid=Integer.parseInt(lidStr);
        String lbuilding=req.getParameter("lbuilding");
        String lclassroom=req.getParameter("lclassroom");
        String laccommodateStr=req.getParameter("laccommodate");
        int laccommodate=Integer.parseInt(laccommodateStr);
        String lfree=req.getParameter("lfree");
        String lremarks=req.getParameter("lremarks");
        String roomstate=req.getParameter("roomstate");


        System.out.println(
                "asdasdasda"+lid
        );

        Laboratory laboratory = new Laboratory(lid,lbuilding,lclassroom,laccommodate,lfree,lremarks,
                roomstate);
        LaboratoryDao laboratoryDao=new LaboratoryDao();
        try {
            laboratoryDao.update(laboratory);

            resp.sendRedirect("selectLaborad");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
