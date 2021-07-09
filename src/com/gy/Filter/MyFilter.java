package com.gy.Filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 类名：MyFilter
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/4/20 20:51
 * 版本：V1.0
 */
public class MyFilter implements Filter {

    String enconding=null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //获取web.xml中的encond参数的值，比如utf-8
        enconding=filterConfig.getInitParameter("encode");

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //强转
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        //传进来类型
        request.setCharacterEncoding(this.enconding);
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
