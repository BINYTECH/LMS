<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
<style>
body{
    overflow: hidden;
    background-color: white;
}
.nav1{

top: 0%;
width: 100%;
}
.menubar {
background-color: #343a40;
float: left;
padding: 0% 0% 100% 0%; 

width: 18%;


}

.lgi {
background-color:  #343a40;
}

.lgi:hover {
background-color: #0a58ca;
}
.icon1 {
height: 17px;
margin-right: 13px;
color: #f9fafb;
}
.logicon {
  height: 17px;
  margin-right: 13px;
  color: #8424BC;
  }
</style>
</head>

<body>

	<div>
	 <%@ include file="nav.jsp" %>
        <div class="fbody">
            
	<div class=" menubar ">
            <a href="ManagerDashboard.jsp" class="list-group-item lgi list-group-item-action" style="display: flex;color:#f9fafb;">
            <i class="bi bi-houses-fill icon1"></i> <span class="d-none d-md-block"> Home</span></a> 
            <a href="ApplyLeave.jsp" class="list-group-item lgi list-group-item-action" style="display: flex;color:#f9fafb">
           <i class="bi bi-file-earmark-medical icon1"></i><span class="d-none d-md-block">Apply Leave</span></a>
            <a href="EventsList.jsp" class="list-group-item lgi list-group-item-action" style="display: flex;color:#f9fafb">
            <i class="bi bi-calendar-event icon1"></i><span class="d-none d-md-block">Events</span></a>
            <a href="LeaveApprove.jsp" class="list-group-item lgi list-group-item-action" style="display: flex;color:#f9fafb">
            <i class="bi bi-card-checklist icon1"></i><span class="d-none d-md-block">Leave Approval</span></a>  
            <a href="ResetPass.jsp" class="list-group-item lgi list-group-item-action" style="display: flex;color:#f9fafb">
             <i class="bi bi-key icon1"></i><span class="d-none d-md-block">Reset Password</span></a>   
        </div>
        <div align="center">
           <b > Welcome to Department Manager Home..!</b>
        </div>
        </div>
	</div>
</body>
</html>