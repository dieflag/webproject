package com.cqkj.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginVerify
 */
@WebFilter("/LoginVerify")
public class LoginVerify implements Filter
{

    /**
     * Default constructor.
     */
    public LoginVerify()
    {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy()
    {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {

        // ��ȡhttpЭ�����
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // ��ȡ���ַ
        String sp = req.getServletPath();

        // �����ж�
        if (sp.equals("/Login.jsp") || sp.equals("/LoginDo.jsp") || sp.equals("/sessinLogin.jsp"))
        {
            if (req.getSession().getAttribute("loginName") == null)
            {
                chain.doFilter(request, response);
            } else
            {
                res.sendRedirect("/WebProjectUI/index.jsp");
            }
        } else if (req.getSession().getAttribute("loginName") == null)
        {
            res.sendRedirect("/WebProjectUI/sessinLogin.jsp");
        } else
        {
            req.setCharacterEncoding("utf-8");
            chain.doFilter(request, response);
        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException
    {
        // TODO Auto-generated method stub
    }

}
