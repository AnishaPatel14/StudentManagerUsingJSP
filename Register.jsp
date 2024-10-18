<%@page import="com.dbs.DBServices"%>
<%@page import="com.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Register</title>
</head>
<body>

<%
UserInfo u = new UserInfo();

u.setUsername(request.getParameter("t1"));
u.setPassword(request.getParameter("t2"));

DBServices dbs = new DBServices();
int x = 0;
x = dbs.registerUser(u);

if(x>0)
{
	request.setAttribute("msg", "<font color = green>Register Successfully</font>");
}
else
{
	request.setAttribute("msg", "<font color = red>Could Not Be Register </font>");
}

%>
<jsp:forward page="Registration.jsp"></jsp:forward>

</body>
</html>