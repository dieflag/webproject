<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ELDo.jsp" method="post">
		昵称：<input type="text" name="userName" /><br />
		所在城市：<input type="text" name="city" /><br />
		您所使用的开发语言： <input type="checkbox" name="language" value="Java" /> Java <input type="checkbox" name="language" value="C++" /> C++
		<input type="checkbox" name="language" value="PHP" /> PHP <input type="checkbox" name="language" value="ASP" /> ASP<br />
		<input type="submit"/>
	</form>
</body>
</html>