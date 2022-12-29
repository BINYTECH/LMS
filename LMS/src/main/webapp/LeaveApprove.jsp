<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leaves</title>
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
           
                <div class="d-flex justify-content-end mb-3">
                   
                    <button class="btn btn-purple" >Pending</button>
                    <button class="btn btn-purple ms-1" >Approved</button>
                    <button class="btn  btn-purple ms-1" >Rejected</button>
                </div> 
                
                <div>
                    <table class="table ">
                        <thead>
                          <tr>
                            <th class="col">Employee ID</th>
                            <th class="col">Name</th>
                            <th class="col">Leave Reason</th>
                            <th class="col">Start Date</th>
                            <th class="col">End Date</th>
                            <th class="col">Duration</th>
                             <th class="col">Status</th>
                             <th class="col">Balance Leaves</th>
                              <th class="col">Action</th>
                              
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${leave}" var="leave" varStatus="emp" > 
                          <tr>
                            <th >${leave.empid}</th>
                            <td>${leave.name}</td>
                            <td>${leave.lname}</td>
                            <td>${leave.t_date}</td>
                             <td>${leave.f_date}</td>
                              <td>${leave.tdays}</td>
                             
                            <td >${leave.status}</td>
                              <td >
                               <!-- Button trigger modal -->
                                        <button type="button" class="btn p-0" data-bs-toggle="modal" data-bs-target="#staticBackdrop${emp.index}" id="#viewEmp${emp.index}">
                                          <a>view</a>
                                        </button>
  
                                        <!-- Modal for emp details -->
                                        <div class="modal  fade" id="staticBackdrop${emp.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-xl">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Balance Leaves</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                 <!-- All emp details -->
                                                <div class="modal-body " style="height:70vh;" >
                                                 <div class="container row  p-2 mb-2 " style="">
                                                   
                                                   <div>
								                    <table class="table">
								                        <thead>
								                          <tr>
								                            
								                            <th class="col">Leave Name</th>
								                            <th class="col">Total Leave</th>
								                            <th class="col">Consumed</th>
								                            <th class="col">Pending</th>
								                            
								                          </tr>
								                        </thead>
								                        <tbody>
								                          <tr>
								                            
								                            <td>Sick leave</td>
								                            <td>15 days</td>
								                            <td >10 days</td>
								                            <td>${emplo.sickleave} days </td>
								                           
								                          </tr>
								                          <tr>
								                           
								                            <td>Casual leave</td>
								                            <td>15 days</td>
								                            <td >10 days</td>
								                            <td>${bleave.casualleave} days</td>
								                          </tr>
								                          <tr>
								                          
								                            <td>Personal leave</td>
								                            <td>15 days</td>
								                            <td >10 days</td>
								                            <td>${bleave.personalleave}days</td>
								                           
								                          </tr>
								                          <tr>
								                          
								                            <td>Marriage Leave</td>
								                            <td>15 days</td>
								                            <td >10 days</td>
								                            <td>${bleave.maariageleave} days</td>
								                           
								                          </tr>
								                          <tr>
								                          
								                            <td>Adoption Leave</td>
								                            <td>30 days</td>
								                            <td >10 days</td>
								                            <td>${bleave.adoptionleave} days</td>
								                           
								                          </tr>
								                          <tr>
								                          
								                            <td>Paternity Leave</td>
								                            <td>30 days</td>
								                            <td >10 days</td>
								                            <td>${bleave.paternityleave} days</td>
								                           
								                          </tr>
								                           <tr>
								                          
								                            <td>Maternity Leave</td>
								                            <td>180 days</td>
								                            <td >140 days</td>
								                            <td>${bleave.maternityleave} days</td>
								                           
								                          </tr>
								                        </tbody>
								                      </table>
								                      </div>

                                                </div>
                                             
                                            </div>
                                            </div>
                                            </div>
                                        </div>
                                        </td>

                            <td><a href="#" id="approve"  ><i class="bi bi-check-square icn app"  ></i></a>
                                <a href="#" id="reject" ><i class="bi bi-x-square icn rej" ></i></a></td>
                          </tr>
                          </c:forEach>
                        </tbody>
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