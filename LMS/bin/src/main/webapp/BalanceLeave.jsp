<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance</title>
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
          <a class="navbar-brand ms-2 " style="color: #8424bd; font-size: 1.4rem;" href="#"><b>Leave Management</b></a>
             <a href="logout" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-box-arrow-left logicon"></i><span class="" style="color: #8424BC;">Logout</span></a>
          </div>
      </nav>        
      <div class="fbody">
             <div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
          <div class="container-fluid bg-white content" style=" width:fit-content;">
        	 <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 " style="padding:70px;padding-top:0;border-radius: 10px;">
           		<h1 align="center" style="color: #8424BC;">Balance Leave</h1>
                
                                                   
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
                          <td id="sl">10 days</td>
                          <td>${bleave.sickleave} days </td>
                         
                        </tr>
                        <tr>
                         
                          <td>Casual leave</td>
                          <td>15 days</td>
                          <td id="cl">10 days</td>
                          <td>${bleave.casualleave} days</td>
                        </tr>
                        <tr>
                        
                          <td>Personal leave</td>
                          <td>15 days</td>
                          <td id="pl">10 days</td>
                          <td>${bleave.personalleave} days</td>
                         
                        </tr>
                        <tr>
                        
                          <td>Marriage Leave</td>
                          <td>15 days</td>
                          <td id="ml" >10 days</td>
                          <td>${bleave.marriageleave} days</td>
                         
                        </tr>
                        <tr>
                        
                          <td>Adoption Leave</td>
                          <td>30 days</td>
                          <td id="al">10 days</td>
                          <td>${bleave.adoptionleave} days</td>
                         
                        </tr>
                        <tr>
                        
                          <td>Paternity Leave</td>
                          <td>30 days</td>
                          <td id="patl" >10 days</td>
                          <td>${bleave.paternityleave} days</td>
                         
                        </tr>
                         <tr>
                        
                          <td>Maternity Leave</td>
                          <td>180 days</td>
                          <td id="matl">140 days</td>
                          <td>${bleave.maternityleave} days</td>
                         
                        </tr>
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
	
	document.getElementById("sl").innerHTML=15-${bleave.sickleave}+" days";
	document.getElementById("cl").innerHTML=15-${bleave.casualleave}+" days";
	document.getElementById("pl").innerHTML=15-${bleave.personalleave}+" days";
	document.getElementById("ml").innerHTML=15-${bleave.marriageleave}+" days";
	document.getElementById("al").innerHTML=30-${bleave.adoptionleave}+" days";
	document.getElementById("matl").innerHTML=180-${bleave.maternityleave}+" days";
	document.getElementById("patl").innerHTML=30-${bleave.paternityleave}+" days";
      </script> 
    


</body>
</html>