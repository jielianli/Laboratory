package com.gy.servlet;

import com.gy.Bean.Teacher;
import com.gy.Dao.TeacherDao;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import sun.security.jgss.HttpCaller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * 类名：Login
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/12 12:34
 * 版本：V1.0
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String tname = req.getParameter("tname");
        String tpass = req.getParameter("tpass");
        System.out.println("用户名：" + tname + "  密码：" + tpass);
        TeacherDao teacherDao = new TeacherDao();
        Teacher teacher = new Teacher();

        try {
            teacher = teacherDao.selectT(tname, tpass);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (teacher == null) {
            //登录失败
            resp.setContentType("text/html;charset=gbk");
            PrintWriter writer = resp.getWriter();
            writer.write("<script>alert('用户名或密码错误');</script>");
            writer.write("<script>window.location.href='loginT.jsp'</script>");


        } else {
            //登录成功
            HttpSession session = req.getSession();
            session.setAttribute("nowteacher", teacher);
            resp.sendRedirect("mainT.jsp");
        }
    }
}
