<%@page import="com.dbs.DBServices"%>
<%@page import="com.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check user</title>
</head>
<body>

<%
UserInfo u = new UserInfo();

u.setUsername(request.getParameter("t1"));
u.setPassword(request.getParameter("t2"));

DBServices dbs = new DBServices();
boolean isValid = dbs.checkUser(u);

if(isValid==true)
{
	%>
	<jsp:forward page="studentindex.jsp"></jsp:forward>
	<%
}
else
{
	request.setAttribute("msg", "<font color = red>Invalid Username/Password</font>");
	%>
		<jsp:forward page="login.jsp"></jsp:forward>
	<%
}

%>

</body>
</html>