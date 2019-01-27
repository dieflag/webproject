<%@page import="com.cqkj.service.UserInfoService"%>
<%@page import="com.cqkj.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改信息</title>
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
		if ($("#loginname").attr("notNull") == "true"
				&& $("#loginpwd").attr("notNull") == "true"
				&& $("#name").attr("notNull") == "true"
				&& $("#age").attr("notNull") == "true") {
			$("#loginname").attr("disabled", false);
			$("#tab").submit();
		} else {
			blLoginName($("#loginname")[0], "loginnameDo");
			bl($("#loginpwd")[0], "loginpwdDo");
			bl($("#name")[0], "nameDo");
			blAge($("#age")[0], "ageDo");
		}
	}

	function foc(id) {
		$("#" + id).css("display", "none");
	}

	function bl(obj, id) {
		obj = $(obj);
		obj.attr("notNull", "true");
		if (obj.val() == "") {
			$("#" + id).css("display", "inline");
			obj.attr("notNull", "false");
		}
	}

	function blAge(obj, id) {
		obj = $(obj);
		obj.attr("notNull", "true");
		if (obj.val() == "") {
			$("#" + id).css("display", "inline");
			obj.attr("notNull", "false");
		}
		if (obj.val() > 150 || obj.val() < 1) {
			$("#" + id).css("display", "inline");
			obj.attr("notNull", "false");
		}
	}

	function blLoginName(obj, id) {
		obj = $(obj);
		obj.attr("notNull", "true");
		if (obj.val() == "") {
			$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;用户名不能为空");
			$("#" + id).css("color", "red");
			$("#" + id).css("display", "inline");
			obj.attr("notNull", "false");
		} else {
			$.ajax({
				url : "userInfoDo.jsp?opt=selectLoginName",
				type : "post",
				data : {
					"loginName" : obj.val()
				},
				dataType : "json",
				success : function(data) {
					if (data.exist == "true") {
						$("#" + id).css("color", "red");
						$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;用户名已被使用");
						$("#" + id).css("display", "inline");
						obj.attr("notNull", "false");
					}
					if (data.exist == "false") {
						$("#" + id).css("color", "green");
						$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;用户名可以使用");
						$("#" + id).css("display", "inline");
					}

				}
			});
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
</head>
<body class="">
	<!--<![endif]-->
	<%!// 判断是添加进来还是编辑进来，true是添加 false是编辑
	boolean addOredit;

	// 储存编辑当行的UserInfo对象
	UserInfo ui;%>
	<%
	    request.setCharacterEncoding("utf-8");

				// 添加是true 编辑是false
				if (request.getParameter("opt").equals("add")) {
					addOredit = true;
				} else {
					ui = new UserInfo();
					ui.setUserId(Integer.parseInt(request.getParameter("userId")));
					ui = new UserInfoService().selectById(ui);
					addOredit = false;
				}
	%>


	<div class="header">

		<h1 class="page-title">编辑</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li><a href="userInfo.jsp">用户管理</a> <span class="divider">/</span></li>
		<li class="active">编辑</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button class="btn btn-primary" onclick="submitTab()">
					<i class="icon-save"></i> 保存
				</button>
				<div class="btn-group"></div>
			</div>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane active in" id="home">
					<form id="tab" method="post"
						action="userInfoDo.jsp?opt=<%=addOredit ? "add" : "editDo"%>">
						<label>用户名<span style="color: red;">&nbsp;&nbsp;*</span></label> <input
							type="text" class="input-xlarge" name="loginname" id="loginname"
							value="<%=addOredit ? "" : ui.getLoginName()%>"
							onfocus="foc('loginnameDo')"
							onblur="blLoginName(this,'loginnameDo')"
							notNull="<%=addOredit ? false : true%>"
							<%=addOredit ? "" : "disabled"%>> <span id="loginnameDo"
							style="color: red; display: none;">&nbsp;&nbsp;&nbsp;&nbsp;用户名不能为空</span>
						<label>密码<span style="color: red;">&nbsp;&nbsp;*</span></label> <input
							type="password" class="input-xlarge" name="loginpwd"
							id="loginpwd" value="<%=addOredit ? "" : ui.getLoginPwd()%>"
							onfocus="foc('loginpwdDo')" onblur="bl(this,'loginpwdDo')"
							notNull="<%=addOredit ? false : true%>"> <span
							id="loginpwdDo" style="color: red; display: none;">&nbsp;&nbsp;&nbsp;&nbsp;密码不能为空<br /></span>
						<label>姓名<span style="color: red;">&nbsp;&nbsp;*</span></label> <input
							type="text" class="input-xlarge" name="name" id="name"
							value="<%=addOredit ? "" : ui.getName()%>"
							onfocus="foc('nameDo')" onblur="bl(this,'nameDo')"
							notNull="<%=addOredit ? false : true%>"> <span
							id="nameDo" style="color: red; display: none;">&nbsp;&nbsp;&nbsp;&nbsp;姓名不能为空<br /></span>
						<label>年龄<span style="color: red;">&nbsp;&nbsp;*</span></label> <input
							type="text" class="input-xlarge" name="age" id="age"
							value="<%=addOredit ? "" : ui.getAge()%>" onfocus="foc('ageDo')"
							onblur="blAge(this,'ageDo')"
							notNull="<%=addOredit ? false : true%>"> <span
							id="ageDo" style="color: red; display: none;">&nbsp;&nbsp;&nbsp;&nbsp;年龄不合法<br /></span>
						<label>部门</label> <select class="input-xlarge" name="deptid"
							id="stDept" value="<%=addOredit ? "" : ui.getDeptId()%>">
						</select> <label>性别</label> <select class="input-xlarge" name="sex"
							value="<%=addOredit ? "" : ui.getSex()%>">
							<option value="y"
								<%=addOredit ? "" : ui.getSex().equals("y") ? "selected" : ""%>>男生</option>
							<option value="x"
								<%=addOredit ? "" : ui.getSex().equals("x") ? "selected" : ""%>>女生</option>
						</select> <label>电话</label> <input type="text" class="input-xlarge"
							name="phone" value="<%=addOredit ? "" : ui.getPhone()%>">
						<label>身份证</label> <input type="text" class="input-xlarge"
							name="idcard" value="<%=addOredit ? "" : ui.getIdCard()%>">
						<label>微信号</label> <input type="text" class="input-xlarge"
							name="wechat" value="<%=addOredit ? "" : ui.getWeChat()%>">
						<label>地址</label>
						<textarea class="input-xlarge" name="address"><%=addOredit ? "" : ui.getAddress()%></textarea>

						<input type="hidden" value="<%=addOredit ? "" : ui.getUserId()%>"
							name="userId" /> <input type="hidden"
							value="<%=addOredit ? "" : ui.getCreateUser()%>"
							name="createUser" /> <input type="hidden"
							value="<%=addOredit ? "" : ui.getCrateDate().getTime()%>"
							name="crateDate" />
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

			// 部门下拉列表的初始化
			$.ajax({
				url : "userInfoDo.jsp?opt=getDept",
				type : "post",
				dataType : "json",
				success : function(data) {
					var stDept = $("#stDept");
					stDept.append("<option value=''>-----请选择-----</option>");
					var dept =
	<%=(addOredit ? false : ui.getDeptId())%>
		;
					for ( var i in data) {
						var str = "<option";
						if (data[i].deptId == dept) {
							str = str + " selected";
						}
						str = str + " value=\"";
						str = str + data[i].deptId;
						str = str + "\">";
						str = str + data[i].deptName;
						str = str + "</option>";

						stDept.append(str);
					}
				}
			});
		});
	</script>

</body>
</html>