<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	您所填写的内容是：<br />
	昵称：${param.userName}<br />
	所在城市：${param.city}<br />
	您所使用的开发语言： 
	<c:forEach items="${paramValues.language}" var="la" varStatus="i">
		${la} ${i.last ? "" :"、"}
	</c:forEach>
	
</body>
</html>