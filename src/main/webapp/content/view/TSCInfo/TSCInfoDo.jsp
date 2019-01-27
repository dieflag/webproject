<%@page import="com.cqkj.service.SelectService"%>
<%@page import="com.cqkj.bean.Select"%>
<%@page import="com.cqkj.bean.TSC"%>
<%@page import="com.cqkj.service.TCourseInfoService"%>
<%@page import="com.cqkj.bean.TCourseInfo"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.cqkj.service.TSCService"%>
<%@page import="com.cqkj.bean.TSCInfo"%>
<%@page import="com.cqkj.bean.PageListIndex"%>
<%@page import="com.alibaba.fastjson.serializer.SerializerFeature"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 设置请求编码
    request.setCharacterEncoding("utf-8");

    // 查询全表或通过keyWord查询cName
    if (request.getParameter("opt").equals("getTSCInfo"))
    {
        TSCService tscs = new TSCService();
        PageList<TSCInfo> pl = new PageList<TSCInfo>();
        pl.setPageIndex(Integer.parseInt(request.getParameter("pageList").toString()));
        tscs.selectByPage(pl, Integer.parseInt(session.getAttribute("userId").toString()));

        PageListIndex<TSCInfo> pli = new PageListIndex<TSCInfo>();
        pli.setPl(pl);
        pli.setPageCount(pl.getPageCount());

        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(pli, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    } else if (request.getParameter("opt").equals("getTCou"))
    {
        List<TCourseInfo> tcous = new TCourseInfoService()
                .unSelect(Integer.parseInt(session.getAttribute("userId").toString()));
        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(tcous, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    } else if (request.getParameter("opt").equals("insetTCou"))
    {
        TSCService tscs = new TSCService();
        TSC sc = new TSC();
        sc.setStuId(Integer.parseInt(session.getAttribute("userId").toString()));
        sc.setCrateDate(new Date());
        sc.setcId(Integer.parseInt(request.getParameter("cId")));
        if (tscs.insert(sc) > 0)
        {
            out.print("{\"msg\":\"OK\"}");
        } else
        {
            out.print("{\"msg\":\"选课失败请联系管理员！\"}");
        }
    }
    // 响应TCourseInfo中的删除按钮
    else if (request.getParameter("opt").equals("delete"))
    {
        TSCService tscs = new TSCService();
        TSC sc = new TSC();
        sc.setScId(Integer.parseInt(request.getParameter("scId")));
        if (tscs.deleteTSC(sc) > 0)
        {
            out.print("{\"msg\":\"OK\"}");
        } else
        {
            out.print("{\"msg\":\"删除选课失败请联系管理员！\"}");
        }
    }
    // 获取已设置成绩的学生选课
    else if (request.getParameter("opt").equals("getTSC"))
    {
        PageList<Select> pl = new PageList<Select>();
        pl.setPageIndex(Integer.parseInt(request.getParameter("pageList").toString()));
        new SelectService().exitsScore(pl);

        PageListIndex<Select> pli = new PageListIndex<Select>();
        pli.setPl(pl);
        pli.setPageCount(pl.getPageCount());

        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(pli, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    }
    // 获取已选课的学生信息
    else if (request.getParameter("opt").equals("getStu"))
    {
        PageList<Select> pl = new PageList<Select>();
        pl.setPageIndex(0);
        new SelectService().alTscStu(pl);

        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(pl, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    }
    // 获取stuId的学生已选的所有课程信息
    else if (request.getParameter("opt").equals("getStuCou"))
    {
        PageList<Select> pl = new PageList<Select>();
        pl.setPageIndex(0);
        new SelectService().getStuCou(pl, Integer.parseInt(request.getParameter("stuId").toString()));

        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(pl, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    }
    // 保存成绩
    else if (request.getParameter("opt").equals("submitScore"))
    {
        // 根据学生id和课程id查询选课对象
        PageList<Select> pl = new PageList<Select>();
        pl.setPageIndex(0);
        new SelectService().selectByStuIdcId(pl, Integer.parseInt(request.getParameter("stuId").toString()),
                Integer.parseInt(request.getParameter("cId").toString()));

        TSC tsc = new TSC();
        tsc.setScId(pl.getData().get(0).getScId());
        tsc.setcId(pl.getData().get(0).getcId());
        tsc.setStuId(pl.getData().get(0).getStuId());
        tsc.setCrateDate(pl.getData().get(0).getCrateDate());
        tsc.setScore(Double.parseDouble(request.getParameter("score")));

        if (new TSCService().update(tsc) > 0)
        {
            out.print("{\"msg\":\"OK\"}");
        } else
        {
            out.print("{\"msg\":\"打分失败请联系管理员！\"}");
        }
    }
    // 获取所有的学生对象
    else if (request.getParameter("opt").equals("allStu"))
    {
        PageList<Select> pl = new PageList<Select>();
        pl.setPageIndex(0);
        new SelectService().allStu(pl);

        out.print(JSON.toJSONString(pl.getData()));
    }
    // 根据stuId查询选课信息
    else if (request.getParameter("opt").equals("getAllSC"))
    {
        PageList<Select> pl = new PageList<Select>();
        pl.setPageIndex(Integer.parseInt(request.getParameter("pageList").toString()));
        new SelectService().allSC(pl, Integer.parseInt(request.getParameter("stuId").toString()));

        PageListIndex<Select> pli = new PageListIndex<Select>();
        pli.setPl(pl);
        pli.setPageCount(pl.getPageCount());

        // 第二个参数设置解析所有 第三个参数设置解析时间
        out.print(JSON.toJSONString(pli, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteDateUseDateFormat));
    }
%>