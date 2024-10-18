<!DOCTYPE html>
<%@page import="com.dto.Student"%>
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
<title>Modify Students</title>
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
            <h5 class="card-title text-center">Modify Student Details</h5>
            <br>
            <%
            String msg = (String)request.getAttribute("msg");
            if(msg!=null)
            {
            	out.print(msg);
            }
            int rno=0;
            try
            {
           rno =Integer.parseInt(request.getParameter("s1"));
            }
            catch(NumberFormatException e)
            {
            	
            }
            DBServices dbs = new DBServices();
            Student s = dbs.getStudent(rno);
            if(s!=null)
            {
            %>
            <br>
            <form class="form-signin" action="save.jsp">
            
              <div class="form-label-group">
                <input type="text" id="rollno" class="form-control" placeholder="Enter Rollno" name="t1" value="<%=s.getRoll()%>" required  autofocus>
                <label for="rollno">Rollno</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="name" class="form-control" placeholder="Enter Name" name="t2" required value="<%=s.getName()%>">
                <label for="name">Name</label>
              </div>

              <div class="form-label-group">
                <input type="text" id="marks" class="form-control" placeholder="Enter Marks" name="t3" required value="<%=s.getMarks()%>">
                <label for="marks">Marks</label>
              </div>

            
              <input class="btn btn-lg btn-google btn-block text-uppercase" type="submit" class="fab fa-google mr-2" name="b1" value="Update Student">
            
              <br>
              <a href="studentindex.jsp">Back To Student Index Page</a>
            </form>
            <%
            }
            %>
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