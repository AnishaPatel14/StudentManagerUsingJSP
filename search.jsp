<!DOCTYPE html>
<%@page import="com.dto.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dbs.DBServices"%>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Search Student</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">	
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesoeet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

</head>
<body>
<%@ include file="header.jsp" %>	
  <div class="login_section">
     <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Search Student</h5>
            <form action="modifystudent.jsp">
            <br>
            <br>
			Select Rollno No To Search Student Detail:<br>
			<select name="s1">
				
			<%
			DBServices dbs = new DBServices();
			ArrayList<Student> al = dbs.getAllStudents();
			for(int i=0; i<al.size(); i++)
			{
				Student s = al.get(i);
				%>
				<option value="<%= s.getRoll()%>"><%= s.getRoll() %></option>
				<%
			}
			
			%>
			
			
			</select>


			<br>
			<input class="btn btn-lg btn-primary btn-block text-uppebtn-blockrcase text-uppercase" type="submit" name="b1" value="Search Student">
			<br>
			<br>
            <a href="studentindex.jsp">Back To Student Index Page</a><br><br>
            </form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
  </div>
  <!-- login section end-->

<%@include file="footer.jsp" %>
</body>
</html>