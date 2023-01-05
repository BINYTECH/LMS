<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset</title>
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
  margin-right: 10px;
  color: #8424BC;
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
  i{
    align-content: center;
    font-size: 200%;
  }
  .lgi{
    height: fit-content;
  }
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
        </div>  </div>
      </nav>

        <div class="fbody">
            
            
        <div >
        	<div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
            <div class="container-fluid content" style=" width:fit-content;">
            
                 <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 " style="border-radius: 10px; width: 500px;">                
                 <form action="resetpassmanager" method="post" class="row g-3 needs-validation"  name="addForm" style="padding: 20px;" onsubmit="return formValidate()">
                    <h1 align="center" style="color: #8424BC;">Reset Password</h1>
                      <div class="col-md-12">
                          <label for="emp_id" class="form-label">Employee ID</label>
                          <input type="text" class="form-control" name="emp_id" id="emp_id" value="${empid}" readonly="readonly"> 
                          <h6 id="vemp_id"></h6>
                        </div>
                        
                        <div class="col-12">
                            <label for="opass" class="form-label">Old Password</label>
                            <input type="password"  class="form-control" name="opass" id="opass" >
                            <h6 id="vopass">${opasswrong}</h6>
                          </div>
                          <div class="col-12">
                            <label for="npass" class="form-label">New Password</label>
                            <input type="password"  class="form-control" name="npass" id="npass" >   
                            <h6 id="vnpass"></h6>
                          </div>
                          <div class="col-12">
                            <label for="cpass" class="form-label">Confirm New Password</label>
                            <input type="password"  class="form-control" name="cpass" id="cpass" >
                            <h6 id="vcpass"></h6>
                          </div>

                          
                          
                          <div class="col-12 d-flex justify-content-center">
                            <input type="submit" class="btn text-white w-25 fw-bold"  style="font-size:1.1rem;background-color:#8424BD;border-radius: 25px;" value="Reset">
                          </div>
                      </form>
                </div>
            </div>
        </div>
        </div>
    </div>

    <!-- javascript validation -->
    <script type="text/javascript">
    	
		const pp=document.referrer;
		document.getElementById("back").href=pp;   
    
      function formValidate(){

        var status=true;
        var empid=document.forms["addForm"]["emp_id"].value;
        var passo=document.forms["addForm"]["opass"].value;
      
        var passn=document.forms["addForm"]["npass"].value;
        var passc=document.forms["addForm"]["cpass"].value;  
        
        
        if(empid==""){
            document.getElementById("vemp_id").innerHTML="*please enter Employee Id";
            status=false;
        }else{
            document.getElementById("vemp_id").innerHTML="";
        }

        if(passo==""){
            document.getElementById("vopass").innerHTML="*please enter password";
            status=false;
        }else{
            document.getElementById("vopass").innerHTML="";
        }
        
        var passreg=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
        if(passreg.test(passn)){
            document.getElementById("vnpass").innerHTML="";
        }else{
            document.getElementById("vnpass").innerHTML="*please enter valid password";
            status=false;
        }

        if(passc==""){
            document.getElementById("vcpass").innerHTML="*please enter password";
            status=false;
        }
        else if(passc!=passn){
            document.getElementById("vcpass").innerHTML="*password does not match";
            status=false;
        }
        else{
            document.getElementById("vcpass").innerHTML="";
        }
     
        return status;
      }
      </script> 
    


</body>
</html>