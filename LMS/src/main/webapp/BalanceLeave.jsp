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

    <div >
       <%@ include file="nav.jsp" %>
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
                            
                            <td>Sick lave</td>
                            <td>15 days</td>
                            <td >10 days</td>
                            <td>5</td>
                           
                          </tr>
                          <tr>
                           
                            <td>Casual lave</td>
                            <td>15 days</td>
                            <td >10 days</td>
                            <td>5</td>
                          </tr>
                          <tr>
                          
                            <td>Personal lave</td>
                            <td>15 days</td>
                            <td >10 days</td>
                            <td>5</td>
                           
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
      </script> 
    


</body>
</html>