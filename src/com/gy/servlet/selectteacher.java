package com.gy.servlet;

import com.gy.Bean.Page;
import com.gy.Bean.Teacher;
import com.gy.Dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 类名：selectteacher
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 22:43
 * 版本：V1.0
 */
@WebServlet("/selectteacher")
public class selectteacher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageNumStr = req.getParameter("pageNum");

        Page page=new Page();
        if(pageNumStr!=null&&!pageNumStr.equals("")){
            int pageNum=Integer.parseInt(pageNumStr);
            page.setPageNum(pageNum);//页码数
        }

        TeacherDao teacherDao=new TeacherDao();
        try {
            //调用查询方法
            List<Teacher> list = teacherDao.selectAllPage(page);

            //查询总条数
            int pageTotal = teacherDao.selectTotal();
            page.setPageTotal(pageTotal);

            //把集合存入request，转发到页面可以取出来
            req.setAttribute("p",page);
            req.setAttribute("teacherlist",list);
            //转到jsp,固定方法getRequestDispatcher
            req.getRequestDispatcher("teacherall.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
