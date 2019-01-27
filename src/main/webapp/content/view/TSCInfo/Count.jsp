<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选课统计</title>
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
	// 分页查询页码
	var pageList = 1;

	// 设置分页查询页码
	function getPageList(index) {
		pageList = index;
		getTSCInfo();
	}

	// 获取所有学生
	function getTCou() {
		$("#slStu").html('<option value="0">---请选择---</option>');
		$
				.ajax({
					url : "TSCInfoDo.jsp",
					type : "post",
					data : {
						"opt" : "allStu"
					},
					dataType : "json",
					success : function(data) {
						var tbInfo = "";
						for (var i = 0; i < data.length; i++) {
							tbInfo = tbInfo
									+ '<option value="';
					tbInfo = tbInfo + data[i].userId;
					tbInfo = tbInfo + '">';
							tbInfo = tbInfo + data[i].name;
							tbInfo = tbInfo + '</option>';
						}
						$("#slStu").append(tbInfo);
					}
				});
	}

	// 获取该学生已选的课程
	function getTSCInfo() {
		$
				.ajax({
					url : "TSCInfoDo.jsp",
					type : "post",
					data : {
						"opt" : "getAllSC",
						"pageList" : pageList,
						"stuId" : $("#slStu").val()
					},
					dataType : "json",
					success : function(pli) {
						var data = pli.pl.data;
						var tbInfo = "";
						for (var i = 0; i < data.length; i++) {
							tbInfo = tbInfo + "<tr><td>";
							tbInfo = tbInfo
									+ (i + 1 + (pli.pl.pageIndex - 1)
											* pli.pl.pageSize) + "</td><td>";
							tbInfo = tbInfo + data[i].cNo + "</td><td>";
							tbInfo = tbInfo + data[i].cName + "</td><td>";
							tbInfo = tbInfo + data[i].score + "</td><td>";
							tbInfo = tbInfo + data[i].crateDate + "</td><tr>";
						}
						$("tbody").text("");
						$("tbody").append(tbInfo);

						if (pli.pageCount > 0) {
							tbInfo = "<ul>";
							tbInfo = tbInfo
									+ '<li onclick="getPageList(1)"><a>首页</a></li>';
							for (var i = 0; i < pli.pageCount; i++) {

								tbInfo = tbInfo + '<li onclick="getPageList('
										+ (i + 1);
								tbInfo = tbInfo + ')"><a>' + (i + 1);
								tbInfo = tbInfo + '</a></li>';
							}
							tbInfo = tbInfo + '<li onclick="getPageList('
									+ pli.pageCount + ')"><a>尾页</a></li></ul>';
							$("#page").text("");
							$("#page").append(tbInfo);
						}
					}
				});
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
	<%
	    request.setCharacterEncoding("utf-8");
	%>
	<!--<![endif]-->
	<div class="header">
		<h1 class="page-title">选课统计</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">选课信息</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div style="margin: 10px 10px;">
				<span>学生：</span> <select id="slStu" style="margin: 0px 10px;">
				</select>
				<button class="btn" id="btnSearch">查&nbsp;询</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<span id="hint"></span>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>课程编号</th>
							<th>课程名称</th>
							<th>成绩</th>
							<th>选课时间</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<div class="pagination" id="page"></div>


		</div>
	</div>



	<script src="../../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});

			// 初始化tbody标签 放入所有课程信息
			getTCou();

			$("#slStu").click(function() {
				$("#hint").text("");
			})

			// 选课按钮
			$("#btnSearch").click(function() {
				$("#hint").css("color", "red");
				if ($("#slStu").val() == null || $("#slStu").val() == 0) {
					$("#hint").text("请选择学生");
				} else {
					getTSCInfo();
					getTSCInfo();
				}
			});
		});
	</script>

</body>
</html>