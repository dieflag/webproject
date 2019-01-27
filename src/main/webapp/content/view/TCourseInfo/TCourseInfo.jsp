<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.cqkj.bean.PageList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>
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
	var pageList = 1;

	function getPageList(index) {
		pageList = index;
		getTCourseInfo();
	}
	function getTCourseInfo() {
		$
				.ajax({
					url : "TCourseInfoDo.jsp",
					type : "post",
					data : {
						"keyWord" : $.trim($("#txtKeyWord").val()),
						"opt" : "getTCourseInfo",
						"pageList" : pageList
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
							tbInfo = tbInfo + data[i].crateDate + "</td><td>";
							tbInfo = tbInfo
									+ '<a href="addTCou.jsp?opt=edit&cId='
									+ data[i].cId
									+ '"><i class="icon-pencil">编辑</i></a>&nbsp;&nbsp;&nbsp;&nbsp';
							tbInfo = tbInfo
									+ '<a href="#myModal" role="button" data-toggle="modal" cId="'+ data[i].cId +'"><i class="icon-remove" style="color: red" id="delete">删除</i></a></td></tr>';
						}
						$("tbody").text("");
						$("tbody").append(tbInfo);

						// 每行的deptid在点击删除按钮后存入DeleteId
						$(".well tbody tr td:last-child a:last-child").click(
								function() {
									$("#DeleteId").val($(this).attr("cid"));
								});

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
		<h1 class="page-title">课程管理</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="/WebProjectUI/index.jsp" target="_top">主页</a> <span
			class="divider">/</span></li>
		<li class="active">课程信息</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="btn-toolbar">
				<button id="btnAddTCou" class="btn btn-primary">
					<i class="icon-plus"></i> 添加课程
				</button>
				<input type="text" id="txtKWDisPlay" style="margin: 0px 10px;" /> <input
					type="hidden" id="txtKeyWord" />
				<button class="btn" id="btnSearch">查&nbsp;询</button>
			</div>
			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>课程编号</th>
							<th>课程名称</th>
							<th>创建时间</th>
							<th style="width: 100px;">操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<div class="pagination" id="page">
				<%-- <ul>
					<li><a href="TCourseInfo.jsp">首页</a></li>
					<% for(int i = 0; i < pageList.getPageCount(); i++) {%>
					    <li><a href="TCourseInfo.jsp?pageIndex=<%=i+1 %>"><%=i+1 %></a></li>
					<% } %>
					<li><a href="TCourseInfo.jsp?pageIndex=<%=pageList.getPageCount()%>">尾页</a></li>
				</ul> --%>
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
						<i class="icon-warning-sign modal-icon"></i>你确定要删除该课程吗?
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

			// 初始化tbody标签 放入所有课程信息
			getTCourseInfo();

			// 控制菜单跳转
			$("#btnAddTCou").click(function() {
				window.location.href = "addTCou.jsp?opt=add"
			});

			// 提示框中的删除按钮
			$("#btnDelete").click(function() {
				$.ajax({
					url : "TCourseInfoDo.jsp",
					type : "post",
					data : {
						"cId" : $("#DeleteId").val(),
						"opt" : "delete"
					},
					dataType : "json",
					success : function(data) {
						if (data.msg == "OK") {
							getTCourseInfo();
						} else {
							alert(data.msg);
						}

					}
				});
			});

			// 查询按钮
			$("#btnSearch").click(function() {
				$("#txtKeyWord").val($("#txtKWDisPlay").val());
				getTCourseInfo();
			});
		});
	</script>

</body>
</html>