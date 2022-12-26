<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details</title>
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
  margin-right: 13px;
  color: #8424BC;
  }
 .btn-purple{
 background-color: #8424bd;
 color:white;
 border-radius:20px;
 }
 .btn-purple:hover{
 background-color: white;
 color:#8424bd;
 border:1px solid #8424bd;
 border-radius:20px;
 }
</style>
</head>

<body>

    <div >
     <%@ include file="nav.jsp" %>
        <div class="fbody">
             <div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
          <div class="container-fluid bg-white content " style=" width:fit-content; ">
        	 <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 p-2  " style=" width: 800px; border-radius: 10px;">
           
                
                <div>
                    <table class="table table-striped table-hover ">

								<tr>
									<th class="col">Employee ID</th>
									<th class="col">Employee Name</th>
									<th class="col">Employee Username</th>
									<th class="col">Employee mobile</th>						
									<th class="col">Date_Of_Joining</th>
									<th  class="col" ></th>
									<th class="col"></th>

								</tr>
								<%-- <c:forEach items="${employees}" var="employee"> --%>
								<tr>
									<th>111</th>
									<td>Akash</td>
									<td>Akash123</td>
									<td>1234567890</td>
									<td>15-01-2023</td>
									<th><a style="color: #3d8bfd;"
										href="employeedetails?emp_id=<c:out value='${employee.emp_id }'/>"><i
											class="bi bi-person-lines-fill " style="color: #052c65;"></i></a>
									</th>
									<th><a style="color: #3d8bfd;" href="delete?emp_id=<c:out value='${employee.emp_id }'/>" onclick="alert()"><i
											class="bi bi-trash3-fill " style="color: #052c65;"></i></a></th>
									
									<!-- <th><a style="color: #3d8bfd;" data-bs-toggle="modal"
										data-bs-target="#exampleModal"><i
											class="bi bi-trash3-fill " style="color: #052c65;"></i></a></th> -->
									<%-- <td>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Are
															you sure you want to delete?</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">you are deleting this
														employee permanently.This can't be undone.</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>

														<a
															href="delete?emp_id=<c:out value='${employee.emp_id }'/>">
															<button type="button" class="btn btn-danger">DELETE</button>
														</a>
													</div>
												</div>
											</div>
										</div>
									</td> --%>
								</tr>

							<%-- </c:forEach> --%>
							</table>
                      </div>
            </div>
        </div>
        </div>
    </div>

    <!-- javascript validation -->
    <script type="text/javascript">
    const pp=document.referrer;
	document.getElementById("back").href=pp;   
      </script> 
    


</body>
</html>