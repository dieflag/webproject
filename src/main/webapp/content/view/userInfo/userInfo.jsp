<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cqkj.bean.UserInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.cqkj.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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

				PageList<UserInfo> pageList = new PageList<UserInfo>();

				// 第一次请求为空，走默认值
				if (request.getParameter("pageIndex") != null) {
					pageList.setPageIndex(Integer.parseInt(request.getParameter("pageIndex")));
				}

				new UserInfoService().selectByPage("select * from UserInfo where isDelete = 0", pageList);

				List<UserInfo> users = pageList.getData();

				request.setAttribute("users", users);
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
				<button id="btnAddUser" class="btn btn-primary">
					<i class="icon-plus"></i> 添加用户
				</button>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>登录名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>地址</th>
							<th>注册日期</th>
							<th style="width: 100px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user" varStatus="i">
							<tr>
								<td>${i.index + pageList.getFirstSeq()}</td>
								<td>${user.loginName}</td>
								<td>${user.name}</td>
								<td>${user.sex eq "x" ? "女" : "男"}</td>
								<td>${user.phone}</td>
								<td>${user.address}</td>
								<td>${user.crateDate.toLocaleString()}</td>
								<td><c:if test="${!(user.loginName eq \"system\")}">
										<a href="addUser.jsp?opt=edit&userId=${user.userId}"><i
											class="icon-pencil">编辑</i></a>&nbsp;&nbsp;&nbsp;&nbsp;
								    	<a href="#myModal" role="button" data-toggle="modal"
											userid="${user.userId}"><i class="icon-remove"
											style="color: red" id="delete">删除</i></a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagination">
				<ul>
					<li><a href="userInfo.jsp">首页</a></li>
					<%
					    for (int i = 0; i < pageList.getPageCount(); i++) {
					%>
					<li><a href="userInfo.jsp?pageIndex=<%=i + 1%>"><%=i + 1%></a></li>
					<%
					    }
					%>
					<li><a
						href="userInfo.jsp?pageIndex=<%=pageList.getPageCount()%>">尾页</a></li>
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
						<i class="icon-warning-sign modal-icon"></i>你确定要删除该用户吗?
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
			$("#btnAddUser").click(function() {
				window.location.href = "addUser.jsp?opt=add"
			});

			// 每行的userid在点击删除按钮后存入DeleteId
			$(".well tbody tr td:last-child a:last-child").click(function() {
				$("#DeleteId").val($(this).attr("userid"));
			});

			// 提示框中的删除按钮
			$("#btnDelete").click(
					function() {
						location.href = "userInfoDo.jsp?opt=delete&userId="
								+ $("#DeleteId").val();
					});
		});
	</script>

</body>
</html>