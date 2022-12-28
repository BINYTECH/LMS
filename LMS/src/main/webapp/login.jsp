<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login Form</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>

.container1{
	margin-top:5%; 
	background:#fff; 
	
}
h6{
    color: red;
    font-size: 12px;
}
#green{
    color:green;
}

/* @media  (max-width:480px) {
    .text-xs-center{
        text-align: center;
    }
    .ms-center{
        margin-left: 35%;
    }
} */


</style>
</head>
<body >
        <nav class="navbar navbar-expand-lg shadow-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand ms-5" href="#" style="color:  #8424BC;">
                    <b>Leave Management</b>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                       
            </div>
        </nav>
		
		<div class="container mt-5" >
			<div class="row align-items-center">
				<div class=" col-md-6">
					<div class="text-center">
						<img  src="/image/login.jpg"    class="rounded img-fluid" alt="...">
					  </div>
				</div>
				<div class="  col-md-6">
				  <form action="login" name="loginForm" style="padding: 50px; " onsubmit="return validateForm()">
					<h1 class="text-xs-center fw-bold" style="color:  #8424BC; font-size:1.8rem;">Welcome Back !</h1>
                    <p class=" text-muted fs-5 fw-semibold">Login to continue</p>
					<div class="form-floating mt-4 mb-4">
						<input type="text" class="form-control" name="username" id="username" placeholder="JonhDoe123">
						<label for="username">Username</label>
						<h6 id="vuser"></h6>
					  </div>
					  
					  <div class="form-floating mb-4">
						<input type="password" class="form-control" name="password" id="password" placeholder="Password">
						<label for="password">Password</label>
						<h6 id="vpass"></h6>
					  </div><br>
					  <div class="d-grid ms-center col-6 ">
						
						<input class="btn text-white fs-5 " style="border-radius:25px;background-color:  #8424BD; height: 45px; width: 60%;" type="submit" value="Login">
						
					  </div>
				  </form>
				</div>
				
			 </div> 
			</div>
	
<script>
	function validateForm(){
		var status=true;
		/* var b= /^[A-Za-z]{1}[A-Za-z0-9._]{2,}@[A_Za-z]{3,}[.]{1}[A-Za-z.]{2,3}$/;
        var p= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/; */
		const user1=document.getElementById("username").value;
		const pass1=document.getElementById("password").value;

         
        //For username/password validation
        if(user1=="" ){
            document.getElementById("vuser").innerHTML="*please enter an username.";      
			status= false;
        }
       else {
    	   document.getElementById("vuser").innerHTML="";        
       }
        if( pass1==""){
            document.getElementById("vpass").innerHTML="*please enter a password.";
			status= false;
        }else {
           document.getElementById("vpass").innerHTML="";     
       }
		return status;

		
    }
		

	
</script>
	
</body>
</html>