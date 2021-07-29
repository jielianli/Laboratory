package com.gy.servlet;

import com.gy.Bean.Curriculum;
import com.gy.Bean.Page;
import com.gy.Dao.CulumDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 类名：selectculum
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/5 13:28
 * 版本：V1.0
 */
@WebServlet("/selectculum")
public class selectculum extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageNumStr = req.getParameter("pageNum");

        Page page=new Page();
        if(pageNumStr!=null&&!pageNumStr.equals("")){
            int pageNum=Integer.parseInt(pageNumStr);
            page.setPageNum(pageNum);//页码数
        }

        CulumDao culumDao=new CulumDao();
        try {
            //调用查询方法
            List<Curriculum> list = culumDao.selectAllPage(page);

            //查询总条数
            int pageTotal = culumDao.selectTotal();
            page.setPageTotal(pageTotal);

            System.out.println("111"+list);
            //把集合存入request，转发到页面可以取出来
            req.setAttribute("p",page);
            req.setAttribute("culumlist",list);

            //转到jsp,固定方法getRequestDispatcher
            req.getRequestDispatcher("culumall.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
