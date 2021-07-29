package com.gy.servlet;

import com.gy.Bean.Admin;
import com.gy.Dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

/**
 * 类名：LoginA
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/4 15:58
 * 版本：V1.0
 */
@WebServlet("/LoginA")
public class LoginA  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String aname = req.getParameter("aname");
        String apass = req.getParameter("apass");
        System.out.println("用户名：" + aname + "  密码：" + apass);

        Admin admin=new Admin();
        AdminDao adminDao=new AdminDao();

        try {
            //调用查询方法，将用户名与密码传过去
            admin = adminDao.select(aname, apass);

            if(admin!=null){
                HttpSession session = req.getSession();
                session.setAttribute("nowadmin",admin);
                req.getRequestDispatcher("main.jsp").forward(req,resp);
            }else {
                resp.setContentType("text/html;charset=gbk");
                PrintWriter writer = resp.getWriter();
                writer.write("<script>alert('用户名或密码错误');</script>");
                writer.write("<script>window.location.href='loginA.jsp'</script>");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
