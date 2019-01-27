<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用云淞大学教务系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="项目描述">
<meta name="author" content="作者">

<link rel="stylesheet" type="text/css"
	href="content/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="content/stylesheets/theme.css">
<link rel="stylesheet"
	href="content/lib/font-awesome/css/font-awesome.css">

<script src="content/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function foc(id) {
		$("#" + id).css("display", "none");
		$("#error").css("display", "none");
	}

	function bl(obj, id) {
		if (obj.value == "") {
			$("#" + id).css("display", "block");
		}
	}

	function focPwd(obj, id) {
		$("#" + id).css("display", "none");
		$("#error").css("display", "none");
	}

	function blPwd(obj, id) {
		if (obj.value == "") {
			$("#" + id).css("display", "block");
		}
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

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

			</ul>
			<a class="brand" href="#"><span class="first">云淞大学</span> <span
				class="second">教务系统</span></a>
		</div>
	</div>
	<div class="row-fluid">
		<div class="dialog">
			<div class="block">
				<p class="block-heading">用户登陆</p>
				<div class="block-body">
					<form id="form" method="post" action="LoginDo.jsp">
						<label>用户名</label> <input type="text" class="span12"
							name="loginName" id="loginName" onfocus="foc('useName')"
							onblur="bl(this,'useName')"> <span id="useName"
							style="color: red; display: none;">用户名不能为空</span><br /> <label>密码</label>
						<input type="password" class="span12" name="loginPwd"
							id="loginPwd" onfocus="focPwd(this,'usePwd')"
							onblur="blPwd(this,'usePwd')"> <span id="usePwd"
							style="color: red; display: none;">密码不能为空<br /></span> <span
							id="error" style="color: red"><%=request.getAttribute("error") == null ? "" : "Error:用户名或密码错误"%></span>
						<input class="btn btn-primary pull-right" style="width: 60px"
							value="登录" id="btnlogin">
						<div class="clearfix"></div>
					</form>
				</div>
			</div>
		</div>
	</div>





	<script src="content/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			// 登录按钮的非空判断
			$("#btnlogin").click(function() {
				if ($("#loginName").val() == "" || $("#loginPwd").val() == "") {
					if ($("#loginName").val() == "") {
						$("#useName").css("display", "block");
					}
					if ($("#loginPwd").val() == "") {
						$("#usePwd").css("display", "block");
					}
				} else {
					// 登入
					$("#form").submit();
				}
			});
		});
	</script>

</body>
</html>