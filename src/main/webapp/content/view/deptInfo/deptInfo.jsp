<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cqkj.bean.DeptInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.cqkj.service.DeptInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户类型管理</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="../../lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="../../stylesheets/theme.css">
<link rel="stylesheet"
	href="../../lib/font-awesome/css/font-awesome.css">

<script src="../../lib/jquery-1.7.2.min.js" type="text/javascript"></script>

<!-- Demo page code -->

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body class="">
	<%
	    request.setCharacterEncoding("utf-8");

				PageList<DeptInfo> pageList = new PageList<DeptInfo>();

				// 第一次请求为空，走默认值
				if (request.getParameter("pageIndex") != null) {
					pageList.setPageIndex(Integer.parseInt(request.getParameter("pageIndex")));
				}

				new DeptInfoService().selectByPage("select * from DeptInfo", pageList);

				List<DeptInfo> depts = pageList.getData();

				request.setAttribute("depts", depts);
				request.setAttribute("pageList", pageList);
	%>
	<!--<![endif]-->
	<div class="header">
		<h1 class="page-title">用户管理</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">用户信息</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnAddDept" class="btn btn-primary">
					<i class="icon-plus"></i> 添加用户类型
				</button>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>用户类型</th>
							<th>用户编号</th>
							<th style="width: 100px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${depts}" var="dept" varStatus="i">
							<tr>
								<td>${i.index + pageList.getFirstSeq()}</td>
								<td>${dept.deptName}</td>
								<td>${dept.deptCode}</td>
								<td><a href="addDept.jsp?opt=edit&deptId=${dept.deptId}"><i
										class="icon-pencil">编辑</i></a>&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="#myModal" role="button" data-toggle="modal"
									deptid="${dept.deptId}"><i class="icon-remove"
										style="color: red" id="delete">删除</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagination">
				<ul>
					<li><a href="deptInfo.jsp">首页</a></li>
					<%
					    for (int i = 0; i < pageList.getPageCount(); i++) {
					%>
					<li><a href="deptInfo.jsp?pageIndex=<%=i + 1%>"><%=i + 1%></a></li>
					<%
					    }
					%>
					<li><a
						href="deptInfo.jsp?pageIndex=<%=pageList.getPageCount()%>">尾页</a></li>
				</ul>
			</div>

			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">删除警告</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>你确定要删除该用户类型吗?
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal" id="btnDelete">删除</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="" id="DeleteId" />



	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			// 控制菜单跳转
			$("#btnAddDept").click(function() {
				window.location.href = "addDept.jsp?opt=add"
			});

			// 每行的deptid在点击删除按钮后存入DeleteId
			$(".well tbody tr td:last-child a:last-child").click(function() {
				$("#DeleteId").val($(this).attr("deptid"));
			});

			// 提示框中的删除按钮
			$("#btnDelete").click(
					function() {
						location.href = "deptInfoDo.jsp?opt=delete&deptId="
								+ $("#DeleteId").val();
					});
		});
	</script>

</body>
</html>