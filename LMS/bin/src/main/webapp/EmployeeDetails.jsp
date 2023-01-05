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
          <a class="navbar-brand ms-2 " style="color: #8424bd; font-size: 1.4rem;" href="dashboard?empid=${empid}"><b>Leave Management</b></a>
         <div class="d-flex">
         <a href="dashboard?empid=${empid}" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-houses-fill logicon"></i><span style="color: #8424BC;">Home</span></a>
          
             <a href="logout" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-box-arrow-left logicon"></i><span style="color: #8424BC;">Logout</span></a>
          </div></div>
      </nav>
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
									<th class="col">Employee Mobile</th>						
									<th class="col">Role</th>
									<th  class="col" ></th>
									<th class="col"></th>

								</tr>
								<c:forEach items="${employee}" var="employee" varStatus="emp"> 
								<tr>
									<th>${employee.empid}</th>
									<td>${employee.name}</td>
									<td>${employee.username}</td>
									<td>${employee.mobile}</td>
									<td>${employee.role}</td>
									<td > 
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn p-0" data-bs-toggle="modal" data-bs-target="#staticBackdrop${emp.index}" id="#viewEmp${emp.index}">
                                          <a><i class="bi bi-person-lines-fill mt-3 "  style="color: #052c65;"></i></a>
                                        </button>
  
                                        <!-- Modal for emp details -->
                                        <div class="modal  fade" id="staticBackdrop${emp.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-fullscreen">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Employee Details</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                 <!-- All emp details -->
                                                <div class="modal-body " style="height:70vh;" >
                                                 <div class="row content-div p-3  bg-light" >
									                <div class="col-6 ">
									                    <div class="d-flex justify-content-center p-4" style="height: 240px;">
									                        <img src="/image/profile.jpg"  class="border border-1 hover-img rounded mt-2" style="height: 140px;width: 140px;"/>
									                    </div>
									                    
									                    <div class="hover-box " style="height: 180px;  margin-top: 2rem">
									                        <div class="card">
									                            <h5 class="card-header text-purple">Basic Details</h5>
									                            <div class="card-body p-0 ms-2">
									                              <table class="table table-borderless">
									                               
									                                <tr>
									                                    <th class="fsize">Username :</th>
									                                    <td class="fdsize">${employee.username}</td>
									                                </tr>
									                                <tr>
									                                    
									                                    <th class="fsize"> Name :</th>
									                                    <td class="fdsize">${employee.name}</td>
									                                   
									                                </tr>
									                                <tr>
									                                    <th class="fsize">Email :</th>
									                                    <td class="fdsize">${employee.email}</td>
									                                </tr>
									                                <tr>
									                                    <th class="fsize">Mobile No :</th>
									                                    <td class="fdsize">${employee.mobile}</td>
									                                </tr>
									                                
									                              </table>
									                            </div>
									                          </div>
									                    </div>
									
									                    
									                   
									                </div>
									                <div class="col-6 ">
									                    <div class="card hover-box mt-2" style="">
															<h5 class="card-header text-purple">Personal info</h5>
															<div class="card-body">
															  <table class="table table-borderless">
																<tr>
									                                <th class="fsize">Date of Birth :</th>
																	<td class="fdsize" >${employee.dob}</td>
									                                <th class="fsize">Gender :</th>
																	<td class="fdsize">${employee.gender}</td>
																	
																</tr>
																<tr>
									                                <th class="fsize">Address :</th>
																	<td class="fdsize" colspan="3">${employee.address}</td>
																	
																	
																</tr>
																<tr>
									                                <th class="fsize">City :</th>
																	<td class="fdsize" >${employee.city}</td>
									                            
																	<th class="fsize">Pin code :</th>
																	<td class="fdsize">${employee.zip}</td>
																</tr>
																<tr>
									                                <th class="fsize">State :</th>
																	<td class="fdsize">${employee.state}</td>
																	
																	
																</tr>
															  </table>
															</div>
														  </div>
									
									                      <div class="card mt-4 hover-box" >
															<h5 class="card-header text-purple">Work Details</h5>
															<div class="card-body p-0 ms-2">
															  <table class="table table-borderless">
																<tr>
																	<th class="fsize">Emp ID :</th>
																	<td class="fdsize">${employee.empid}</td>
									                            </tr>
									                            <tr>
									                                <th class="fsize">Date of Joining :</th>
									                                <td class="fdsize">${employee.doj}</td>
									                            </tr>
																<tr>
									                                <th class="fsize">Designation :</th>
																	<td class="fdsize">${employee.designation}</td>
									                            </tr>	
																
																<tr>
																	
																	<th class="fsize">Employee Type :</th>
																	<td class="fdsize">${employee.role}</td>
																</tr>
																
															  </table>
															</div>
														  </div>
									                    
									                    
									                    
									                    
									                </div>
									            </div>

                                                </div>
                                              <!-- Buttons can be further used to implement edit and other option-->
                                                <div class="modal-footer">
                                                
                                                <a href="editdetails?empid=<c:out value='${employee.empid }'/>" class="btn btn-purple">Edit</a>
                                                </div>
                                            </div>
                                            </div>
                                        </div></td>
                                        <!-- model close -->
                                        
                                        <!-- button for delete -->
										<td> <button type="button" class="btn p-0 " data-bs-toggle="modal" data-bs-target="#exampleModal${emp.index}" id="deletedetails${emp.index}">
                                                    <i class="bi bi-trash3-fill " style="color: #052c65;"></i>
                                                </button>
											 <!-- Modal -->
                                                <div class="modal fade" id="exampleModal${emp.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                        Are you sure want to delete the data?
                                                        </div>
                                                        <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <a href="delete?empid=<c:out value='${employee.empid }'/>&eempid=${empid}" class="btn btn-purple">Delete</a>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div>
											
											</td>
								</tr>

							 </c:forEach>
							</table>
                      </div>
            </div>
        </div>
        </div>
    </div>
	
	<!-- cdn link sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- javascript validation -->
    <script type="text/javascript">
    const pp=document.referrer;
	document.getElementById("back").href=pp;  
	
	
	if(${addsuccess}==true){
    	swal("Success", "Employee is added successfully", "success");
    }
	if(${deletesuccess}==true){
    	swal("Success", "Employee is deleted successfully", "success");
    }
	if(${updatesuccess}==true){
    	swal("Success", "Employee is updated successfully", "success");
    }
		
      </script> 
    <%session.setAttribute("addsuccess", false); %>
     <%session.setAttribute("deletesuccess", false); %>
     <%session.setAttribute("updatesuccess", false); %>
    
    
	

</body>
</html>