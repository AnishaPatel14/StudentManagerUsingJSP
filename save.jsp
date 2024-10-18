<%@page import="com.dbs.DBServices"%>
<%@page import="com.dto.Student"%>
<%@page import="com.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save</title>
</head>
<body>
<%
Student s = new Student();
try
{
	s.setRoll(Integer.parseInt(request.getParameter("t1")));	
}
catch(NumberFormatException e)
{
	
}

s.setName(request.getParameter("t2"));
try
{
	s.setMarks(Double.parseDouble(request.getParameter("t3")));	
}
catch(NumberFormatException e)
{
	
}

String op = request.getParameter("b1");

DBServices dbs = new DBServices();
int x = 0;
//System.out.println(op);
if(op.equals("Add"))
{
	x = dbs.addStudent(s);
	if(x>0)
	{
		request.setAttribute("msg", "<font color = green>Student Register Successfully</font>");
	}
	else
	{
		request.setAttribute("msg", "<font color = red>Student Could Not Be Register </font>");
	}
}
if(op.equals("Update"))
{
	x = dbs.modifyStudent(s);
	if(x>0)
	{
		request.setAttribute("msg", "<font color = green>Student Updated Successfully</font>");
	}
	else
	{
		request.setAttribute("msg", "<font color = red>Student Could Not Be Updated </font>");
	}
}
if(op.equals("Update Student"))
{
	x = dbs.modifyStudent(s);
	if(x>0)
	{
		request.setAttribute("msg", "<font color = green>Student Updated Successfully</font>");
	}
	else
	{
		request.setAttribute("msg", "<font color = red>Student Could Not Be Updated </font>");
	}
	%>
	<jsp:forward page="modifystudent.jsp"></jsp:forward>
	<%
	
}
if(op.equals("Delete"))
{
	x = dbs.deleteStudent(s);
	if(x>0)
	{
		request.setAttribute("msg", "<font color = green>Student Deleted Successfully</font>");
	}
	else
	{
		request.setAttribute("msg", "<font color = red>Student Could Not Be Deleted </font>");
	}
}

%>
<jsp:forward page="amd.jsp"></jsp:forward>
</body>
</html>