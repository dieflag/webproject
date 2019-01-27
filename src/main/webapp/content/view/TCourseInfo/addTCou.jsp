<%@page import="com.cqkj.service.TCourseInfoService"%>
<%@page import="com.cqkj.bean.TCourseInfo"%>
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
		if ($("#cName").attr("notNull") == "true"
				&& $("#cNo").attr("notNull") == "true") {
			$("#tab").submit();
		} else {
			bl($("#cName")[0], "cNameDo");
			bl($("#cNo")[0], "cNoDo");
		}
	}

	function foc(id) {
		$("#" + id).css("display", "none");
	}

	function bl(obj, id) {
		obj = $(obj);
		obj.attr("notNull", "true");
		if (obj.val() == "") {
			$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;不能为空");
			$("#" + id).css("color", "red");
			$("#" + id).css("display", "inline");
			obj.attr("notNull", "false");
		} else {
			if ($("#hi" + id.substring(0, id.length - 2)).val() == obj.val()) {
				$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;可以使用");
				$("#" + id).css("color", "green");
				$("#" + id).css("display", "inline");
			} else {
				$.ajax({
					url : "TCourseInfoDo.jsp?opt=selectRepeat",
					type : "post",
					data : {
						"repeatName" : id,
						"repeatValue" : obj.val()
					},
					dataType : "json",
					success : function(data) {
						if (data.exist == "true") {
							$("#" + id).css("color", "red");
							$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;已被使用");
							$("#" + id).css("display", "inline");
							obj.attr("notNull", "false");
						}
						if (data.exist == "false") {
							$("#" + id).css("color", "green");
							$("#" + id).html("&nbsp;&nbsp;&nbsp;&nbsp;可以使用");
							$("#" + id).css("display", "inline");
						}

					}
				});
			}
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

	// 储存编辑当行的deptInfo对象
	TCourseInfo tci;%>
	<%
	    request.setCharacterEncoding("utf-8");

				// 添加是true 编辑是false
				if (request.getParameter("opt").equals("add")) {
					addOredit = true;
				} else {
					tci = new TCourseInfo();
					tci.setcId(Integer.parseInt(request.getParameter("cId")));
					tci = new TCourseInfoService().selectById(tci);
					addOredit = false;
				}
	%>


	<div class="header">

		<h1 class="page-title">编辑</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li><a href="TCourseInfo.jsp">课程信息</a> <span class="divider">/</span></li>
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
						action="TCourseInfoDo.jsp?opt=<%=addOredit ? "add" : "editDo"%>">
						<label>课程名称<span style="color: red;">&nbsp;&nbsp;*</span></label>
						<input type="text" class="input-xlarge" name="cName" id="cName"
							value="<%=addOredit ? "" : tci.getcName()%>"
							onfocus="foc('cNameDo')" onblur="bl(this,'cNameDo')"
							notNull="<%=addOredit ? false : true%>"> <span
							id="cNameDo" style="color: red; display: none;">&nbsp;&nbsp;&nbsp;&nbsp;不能为空</span>
						<label>课程编号<span style="color: red;">&nbsp;&nbsp;*</span></label>
						<input type="text" class="input-xlarge" name="cNo" id="cNo"
							value="<%=addOredit ? "" : tci.getcNo()%>" onfocus="foc('cNoDo')"
							onblur="bl(this,'cNoDo')" notNull="<%=addOredit ? false : true%>">
						<span id="cNoDo" style="color: red; display: none;">&nbsp;&nbsp;&nbsp;&nbsp;不能为空<br /></span>
						<input type="hidden" value="<%=addOredit ? "" : tci.getcId()%>"
							name="hicId" /> <input type="hidden"
							value="<%=addOredit ? "" : tci.getcName()%>" name="hicName"
							id="hicName" /> <input type="hidden"
							value="<%=addOredit ? "" : tci.getcNo()%>" name="hicNo"
							id="hicNo" /> <input type="hidden"
							value="<%=addOredit ? "" : tci.getCrateDate().getTime()%>"
							name="hiCrateDate" id="hiCrateDate" />
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
						<i class="icon-warning-sign modal-icon"></i>您确定要删除吗？
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
		});
	</script>

</body>
</html>