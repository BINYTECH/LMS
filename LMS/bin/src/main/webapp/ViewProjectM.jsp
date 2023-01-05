<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/main.css"><style>
    
body{overflow: hidden;
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
.content{
 width: fit-content; 
max-height: 33rem;
overflow: scroll;
padding: 0% 10%;
}
.content::-webkit-scrollbar{
    display: none;
}
h6{
  color: red;
  font-size: 12px;
}
@media  (max-width:600px) {
  .d-none{
    display: none;
  }
  
  .lgi{
    height: fit-content;
    
  }
}
.icn{
    color: black; 
    font-size: 20px;
}
.app:hover{
    color: green;
}
.rej:hover{
    color: red;
}
.logicon {
  height: 17px;
  margin-right: 10px;
  color: #8424BC;
  }
 .btn-purple{
 background-color: #8424bd;
 color:white;
 
 }

</style>
</head>

<body>
 <%
    if(session.getAttribute("empid")==null){
    	response.sendRedirect("login.jsp");
    }
    %>
    <div >
         <nav class="navbar navbar-expand-lg bg-light shadow-lg " >
        <div class="container-fluid">
          <a class="navbar-brand ms-2 " style="color: #8424bd; font-size: 1.4rem;" href="dashboardM?empid=${empid}"><b>Leave Management</b></a>
       <div class="d-flex">
         <a href="dashboardM?empid=${empid}" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-houses-fill logicon"></i><span style="color: #8424BC;">Home</span></a>
             <a href="logout" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-box-arrow-left logicon"></i><span class="" style="color: #8424BC;">Logout</span></a>
         </div>
          </div>
      </nav>
        <div class="fbody">
             <div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
          <div class="container-fluid bg-white content " style=" width:fit-content; ">
        	 <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 p-2  " style=" width: fit-content; border-radius: 10px;">
           
                
                <div>
                    <table class="table table-striped table-hover ">

								<tr>
									<th class="col">Project ID</th>
									<th class="col">Project Name</th>
									<th class="col">Description</th>
									<th  class="col" >Start Date</th>
                                    <th class="col">End Date</th>
                                    <th class="col">Assigned To</th>	
									<th class="col">Status</th>
									

								</tr>
								<c:forEach items="${pdetails}" var="pdetails" varStatus="emp"> 
								<tr>
									<td>${pdetails.pid}</td>
									<td>${pdetails.name}</td>
									<td>${pdetails.description}</td>
									<td>${pdetails.s_date}</td>
									<td>${pdetails.e_date}</td>
									<td>${pdetails.assigned_to}</td>
									<td>${pdetails.status}</td>
                                        
                                        
										
											 
								</tr>

							 </c:forEach>
							</table>
                      </div>
            </div>
        </div>
        </div>
    </div>
<script type="text/javascript">
const pp=document.referrer;
document.getElementById("back").href=pp;  
</script>
   


</body>
</html>