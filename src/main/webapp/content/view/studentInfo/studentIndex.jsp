<%@page import="com.cqkj.service.StudentService"%>
<%@page import="com.cqkj.bean.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理</title>
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

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body class="">
	<!--<![endif]-->
	<div class="header">

		<h1 class="page-title">学生信息</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">学生信息</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnAddUser" class="btn btn-primary">
					<i class="icon-plus"></i> 添加学生
				</button>
				<button class="btn">导入</button>
				<button class="btn">导出</button>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>编号</th>
							<th>姓名</th>
							<th>年龄</th>
							<th>性别</th>
							<th style="width: 100px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<%
						    request.setAttribute("stus", new StudentService().SelectAll());
									List<Student> stus = (List<Student>) request.getAttribute("stus");
									for (Student st : stus) {
										out.print("<tr><td>");
										out.print(st.getStuId());
										out.print("</td><td>");
										out.print(st.getStuNo());
										out.print("</td><td>");
										out.print(st.getStuName());
										out.print("</td><td>");
										out.print(st.getStuAge());
										out.print("</td><td>");
										out.print(st.getStuSex());
										out.print("</td>");
										out.print("<td><a href=\"user.jsp\"><i class=\"icon-pencil\">编辑</i>&nbsp;&nbsp;&nbsp;&nbsp;</a>");
										out.print(
												"<a href=\"#myModal\" role=\"button\" data-toggle=\"modal\"><i class=\"icon-remove\" style=\"color: red\">删除</i></a></td>");
									}
						%>

					</tbody>
				</table>
			</div>
			<div class="pagination">
				<ul>
					<li><a href="#">首页</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">尾页</a></li>
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
						<i class="icon-warning-sign modal-icon"></i>你确定要删除该位学生吗?
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal">删除</button>
				</div>
			</div>
		</div>
	</div>




	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			// 控制菜单跳转
			$("#btnAddUser").click(function() {
				window.location.href = "user.jsp"
			});
		});
	</script>

</body>
</html>