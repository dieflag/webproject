<%@page import="com.cqkj.bean.DeptInfo"%>
<%@page import="com.cqkj.service.DeptInfoService"%>
<%@page import="com.cqkj.bean.UserInfo"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.cqkj.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    UserInfoService uis = new UserInfoService();
    UserInfo ui = uis.login(request.getParameter("loginName"), request.getParameter("loginPwd"));
    if (ui != null)
    {
        session.setAttribute("loginName", ui.getLoginName());
        session.setAttribute("userId", ui.getUserId());
        DeptInfo di = new DeptInfo();
        di.setDeptId(ui.getDeptId());
        di = new DeptInfoService().selectById(di);
        session.setAttribute("userType", di.getDeptCode());

        response.sendRedirect("index.jsp");
    } else
    {
        request.setAttribute("error", "0");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
%>