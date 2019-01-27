<%@page import="com.cqkj.service.infoStudent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改信息</title>
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
<script type="text/javascript">
	function submitTab() {
		$("#tab").submit();
	}
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



	<div class="header">

		<h1 class="page-title">编辑</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">编辑</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button class="btn btn-primary" onclick="submitTab()">
					<i class="icon-save"></i> 保存
				</button>
				<a href="#myModal" data-toggle="modal" class="btn">删除</a>
				<div class="btn-group"></div>
			</div>
			<div class="well">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
					<li><a href="#profile" data-toggle="tab">密码</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active in" id="home">
						<form id="tab" method="get" action="infoStudent">
							<label>姓名</label> <input type="text" value="张三"
								class="input-xlarge" name="stuName"> <label>编号</label> <input
								type="text" value="S???" class="input-xlarge" name="stuNo">
							<label>年龄</label> <input type="number" value="18"
								class="input-xlarge" name="stuAge"> <label>性别</label> <select
								class="input-xlarge" name="stuSex">
								<option value="1">男生</option>
								<option value="2">女生</option>
							</select>
						</form>
					</div>
					<div class="tab-pane fade" id="profile">
						<form id="tab2">
							<label>新密码</label> <input type="password" class="input-xlarge">
							<div>
								<button class="btn btn-primary">更新</button>
							</div>
						</form>
					</div>
				</div>

			</div>

			<div class="modal small hide fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">Delete Confirmation</h3>
				</div>
				<div class="modal-body">

					<p class="error-text">
						<i class="icon-warning-sign modal-icon"></i>Are you sure you want
						to delete the user?
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
					<button class="btn btn-danger" data-dismiss="modal">Delete</button>
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
		});
	</script>

</body>
</html>