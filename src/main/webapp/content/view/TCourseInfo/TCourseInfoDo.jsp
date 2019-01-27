<%@page import="com.cqkj.bean.PageListIndex"%>
<%@page import="com.alibaba.fastjson.serializer.SerializerFeature"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="com.cqkj.service.TCourseInfoService"%>
<%@page import="com.cqkj.bean.TCourseInfo"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 设置请求编码
    request.setCharacterEncoding("utf-8");

    TCourseInfo tci = new TCourseInfo();
    TCourseInfoService tcis = new TCourseInfoService();

    // 查询全表或通过keyWord查询cName
    if (request.getParameter("opt").equals("getTCourseInfo"))
    {
        PageList<TCourseInfo> pl = new PageList<TCourseInfo>();
        pl.setPageIndex(Integer.parseInt(request.getParameter("pageList").toString()));
        tcis.getSelectCName(pl, request.getParameter("keyWord").toString());

        PageListIndex<TCourseInfo> pli = new PageListIndex<TCourseInfo>();
        pli.setPl(pl);
        pli.setPageCount(pl.getPageCount());

        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(pli, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    }
    // 响应addTCou中的保存按钮（当这是新增时）
    else if (request.getParameter("opt").equals("add"))
    {
        tci.setcName(request.getParameter("cName"));
        tci.setcNo(request.getParameter("cNo"));
        tci.setCrateDate(new Date());
        if (tcis.insert(tci) == 1)
        {
            response.sendRedirect("TCourseInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应TCourseInfo中的删除按钮
    else if (request.getParameter("opt").equals("delete"))
    {
        if (tcis.deleteById(Integer.parseInt(request.getParameter("cId"))) > 0)
        {
            out.print("{\"msg\":\"OK\"}");
        } else
        {
            out.print("{\"msg\":\"违反约束：必须先删除在该部门下的所有用户才能删除该总该部门！\"}");
        }
    }
    // 响应addTCou中的保存按钮（当这是编辑时）
    else if (request.getParameter("opt").equals("editDo"))
    {
        tci.setcId(Integer.parseInt(request.getParameter("hicId").toString()));
        tci.setCrateDate(new Date(Long.parseLong(request.getParameter("hiCrateDate").toString())));
        tci.setcName(request.getParameter("cName"));
        tci.setcNo(request.getParameter("cNo"));
        if (tcis.update(tci) == 1)
        {
            response.sendRedirect("TCourseInfo.jsp");
        } else
        {
            response.sendRedirect("/WebProjectUI/403.html");
        }
    }
    // 响应addTCou中的重名验证
    else if (request.getParameter("opt").equals("selectRepeat"))
    {
        String repeatName = request.getParameter("repeatName");
        repeatName = repeatName.substring(0, repeatName.length() - 2);

        String repeatValue = request.getParameter("repeatValue");
        if (tcis.exit(repeatName, repeatValue))
        {
            out.print("{\"exist\":\"true\"}");
        } else
        {
            out.print("{\"exist\":\"false\"}");
        }
    }
%>