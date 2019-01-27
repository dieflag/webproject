package com.cqkj.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqkj.bean.Student;

@WebServlet("/infoStudent")
public class infoStudent extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");

        Student st = new Student();

        st.setStuNo(request.getParameter("stuNo"));
        st.setStuName(request.getParameter("stuName"));
        st.setStuAge(Integer.parseInt(request.getParameter("stuAge")));

        if (request.getParameter("stuSex").equals("1"))
        {
            st.setStuSex("ÄÐ");
        } else
        {
            st.setStuSex("Å®");
        }

        StudentService sds = new StudentService();

        if (sds.insert(st) == 1)
        {
            response.sendRedirect("studentIndex.jsp");
        } else
        {
            response.sendRedirect("403.html");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
