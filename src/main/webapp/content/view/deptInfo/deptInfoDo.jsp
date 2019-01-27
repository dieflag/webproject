<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.cqkj.service.DeptInfoService"%>
<%@page import="com.cqkj.bean.DeptInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 设置请求编码
    request.setCharacterEncoding("utf-8");

    DeptInfo di = new DeptInfo();
    DeptInfoService dis = new DeptInfoService();

    // 响应adddept中的保存按钮（当这是新增时）
    if (request.getParameter("opt").equals("add"))
    {
        di.setDeptName(request.getParameter("deptName"));
        di.setDeptCode(request.getParameter("deptCode"));

        if (dis.insert(di) == 1)
        {
            response.sendRedirect("deptInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应deptInfo中的删除按钮
    else if (request.getParameter("opt").equals("delete"))
    {
        di.setDeptId(Integer.parseInt(request.getParameter("deptId")));
        if (dis.deleteById(di) == 1)
        {
            response.sendRedirect("deptInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应adddept中的保存按钮（当这是编辑时）
    else if (request.getParameter("opt").equals("editDo"))
    {
        di.setDeptId(Integer.parseInt(request.getParameter("deptId")));
        di.setDeptName(request.getParameter("deptName"));
        di.setDeptCode(request.getParameter("deptCode"));

        if (dis.update(di) == 1)
        {
            response.sendRedirect("deptInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应adddept中的重名验证
    else if (request.getParameter("opt").equals("selectRepeat"))
    {
        String repeatName = request.getParameter("repeatName");
        repeatName = repeatName.substring(0, repeatName.length() - 2);

        String repeatValue = request.getParameter("repeatValue");
        if (dis.exit(repeatName, repeatValue))
        {
            out.print("{\"exist\":\"true\"}");
        } else
        {
            out.print("{\"exist\":\"false\"}");
        }
    }
%>