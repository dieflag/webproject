<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用云淞大学教务系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="content/lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="content/stylesheets/theme.css">
<link rel="stylesheet"
	href="content/lib/font-awesome/css/font-awesome.css">

<script src="content/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	
</script>
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

</head>
<body class="">
	<!--<![endif]-->
	<!-- 标题栏 -->
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				<li><a href="#"
					class="hidden-phone visible-tablet visible-desktop" role="button">设置</a></li>
				<li id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i> <%=session.getAttribute("loginName")%><i
						class="icon-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<!-- 隐藏设置 -->
						<!-- <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
						<li class="divider visible-phone"></li> -->
						<li><a tabindex="-1" id="exit">退出</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="index.jsp"><span class="first">云淞大学</span>
				<span class="second">教务系统</span></a>
		</div>
	</div>

	<!-- 左菜单栏 -->
	<div class="sidebar-nav">
		<c:if test="${userType eq \"system\"}">
			<a href="#user-menu" class="nav-header" data-toggle="collapse"><i
				class="icon-dashboard"></i>系统管理 <i class="icon-chevron-up"></i></a>
			<ul id="user-menu" class="nav nav-list in collapse">
				<li><a data-href="content/view/userInfo/userInfo.jsp">用户信息管理</a></li>
			</ul>
			<ul id="user-menu" class="nav nav-list in collapse">
				<li><a data-href="content/view/deptInfo/deptInfo.jsp">用户类型管理</a></li>
			</ul>
			<a href="#others" class="nav-header collapsed" data-toggle="collapse"><i
				class="icon-dashboard"></i>教务管理 <i class="icon-chevron-up"></i></a>
			<ul id="others" class="nav nav-list collapse">
				<li><a data-href="content/view/TCourseInfo/TCourseInfo.jsp">课程管理</a></li>
				<li><a data-href="content/view/TSCInfo/changeScore.jsp">成绩管理</a></li>
				<li><a data-href="content/view/TSCInfo/Count.jsp">选课统计</a></li>
			</ul>
		</c:if>
		<c:if test="${!(userType eq \"system\")}">
			<a href="#others" class="nav-header" data-toggle="collapse"><i
				class="icon-dashboard"></i>教务管理 <i class="icon-chevron-up"></i></a>
			<ul id="others" class="nav nav-list in collapse">
				<c:if test="${userType eq \"teacher\"}">
					<li><a data-href="content/view/TSCInfo/changeScore.jsp">成绩管理</a></li>
				</c:if>
				<c:if test="${userType eq \"student\"}">
					<li><a data-href="content/view/TSCInfo/TSCInfo.jsp">学生选课</a></li>
				</c:if>
			</ul>
		</c:if>

		<!-- <a href="#others" class="nav-header collapsed" data-toggle="collapse"><i
			class="icon-dashboard"></i>其他管理 <i class="icon-chevron-up"></i></a>
			<ul id="others" class="nav nav-list collapse">
				<li><a data-href="content/view/studentInfo/studentIndex.jsp">学生信息查询</a></li>
			</ul> -->
	</div>

	<div class="content">
		<div
			style="position: absolute; left: 0px; top: 0px; bottom: 0px; right: 0px; padding: 0px">
			<iframe id="contextFrame" name="contextFrame" src="welcome.jsp"
				width="100%" height="100%" style="border: 0px;"></iframe>
		</div>
	</div>



	<script src="content/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			// 初始化菜单点击事件
			$(".collapse li").each(
					function(index) {
						var curUrl = $(this).find("a").attr("data-href")
								+ "?r=" + Math.ceil(Math.random() * 1000);
						$(this).click(function() {
							$("#contextFrame").attr("src", curUrl);
						});

						$(this).css("cursor", "pointer");
					});

			$("#exit").click(function() {
				$.ajax({
					url : "indexDo.jsp",
					dataType : "text",
					success : function(data) {
						location.href = "Login.jsp";
					}
				});
			});
		});
	</script>

</body>
</html>