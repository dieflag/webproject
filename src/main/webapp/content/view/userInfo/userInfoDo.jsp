<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.cqkj.service.DeptInfoService"%>
<%@page import="com.cqkj.bean.DeptInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.cqkj.service.UserInfoService"%>
<%@page import="com.cqkj.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 设置请求编码
    request.setCharacterEncoding("utf-8");

    UserInfo ui = new UserInfo();
    UserInfoService uis = new UserInfoService();

    // 响应addUser中的保存按钮（当这是新增时）
    if (request.getParameter("opt").equals("add"))
    {
        ui.setLoginName(request.getParameter("loginname"));
        ui.setLoginPwd(request.getParameter("loginpwd"));
        ui.setName(request.getParameter("name"));
        ui.setAge(Integer.parseInt(request.getParameter("age")));
        ui.setDeptId(Integer.parseInt(request.getParameter("deptid")));
        ui.setSex(request.getParameter("sex"));
        ui.setPhone(request.getParameter("phone"));
        ui.setIdCard(request.getParameter("idcard"));
        ui.setWeChat(request.getParameter("wechat"));
        ui.setAddress(request.getParameter("address"));
        ui.setCrateDate(new Date());
        ui.setLastUpdateDate(new Date());
        ui.setCreateUser(Integer.parseInt(session.getAttribute("userId").toString()));
        ui.setLastUpdateUser(Integer.parseInt(session.getAttribute("userId").toString()));

        if (uis.insert(ui) == 1)
        {
            response.sendRedirect("userInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应userInfo中的删除按钮
    else if (request.getParameter("opt").equals("delete"))
    {
        ui.setUserId(Integer.parseInt(request.getParameter("userId")));
        uis.deleteById(ui);
        response.sendRedirect("userInfo.jsp");
    }
    // 响应addUser中的保存按钮（当这是编辑时）
    else if (request.getParameter("opt").equals("editDo"))
    {
        ui.setUserId(Integer.parseInt(request.getParameter("userId")));
        ui.setLoginName(request.getParameter("loginname"));
        ui.setLoginPwd(request.getParameter("loginpwd"));
        ui.setName(request.getParameter("name"));
        ui.setAge(Integer.parseInt(request.getParameter("age")));
        ui.setDeptId(Integer.parseInt(request.getParameter("deptid")));
        ui.setSex(request.getParameter("sex"));
        ui.setPhone(request.getParameter("phone"));
        ui.setIdCard(request.getParameter("idcard"));
        ui.setWeChat(request.getParameter("wechat"));
        ui.setAddress(request.getParameter("address"));

        ui.setCreateUser(Integer.parseInt(request.getParameter("createUser")));
        ui.setCrateDate(new Date(Long.parseLong(request.getParameter("crateDate"))));

        ui.setLastUpdateDate(new Date());
        ui.setLastUpdateUser(Integer.parseInt(session.getAttribute("userId").toString()));

        if (uis.update(ui) == 1)
        {
            response.sendRedirect("userInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应addUser中的重名验证
    else if (request.getParameter("opt").equals("selectLoginName"))
    {
        if (uis.exit(request.getParameter("loginName")))
        {
            out.print("{\"exist\":\"true\"}");
        } else
        {
            out.print("{\"exist\":\"false\"}");
        }
    }
    // 异步查询部门下拉菜单
    else if (request.getParameter("opt").equals("getDept"))
    {
        List<DeptInfo> depts = new DeptInfoService().selectAllDeptInfo();

        String deptStr = JSON.toJSONString(depts);

        out.print(deptStr);
        /* StringBuilder sb = new StringBuilder();
        sb.append("[");
        
        for(DeptInfo d : depts)
        {
            sb.append("{");
            sb.append("\"deptId\":\"").append(d.getdeptId()).append("\",");
            sb.append("\"deptName\":\"").append(d.getdeptName()).append("\"");
            sb.append("},");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append("]");
        out.print(sb.toString()); */
    }
%>