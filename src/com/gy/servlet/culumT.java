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
import java.util.List;

/**
 * 类名：culumT
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/13 8:57
 * 版本：V1.0
 */
@WebServlet("/culumT")
public class culumT extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Teacher teacher=(Teacher) session.getAttribute("nowteacher");

        CulumDao culumDao = new CulumDao();

        System.out.println("eeeeeeeeeeeeeeeeeee"+teacher);
        try {
            List<Curriculum> list = culumDao.selectC(teacher.getTid());

            req.setAttribute("cur",list);
            req.getRequestDispatcher("curriculumT.jsp").forward(req,resp);


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
