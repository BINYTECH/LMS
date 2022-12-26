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
    /* .nav1{
    /* position: fixed; 
    top: 0%;
    width: 100%;
    } */
    .menubar {
    background-color: #343a40;
    float: left;
    padding: 0% 0% 100% 0%; 
    width: 18%;
    /* border: 10px solid #7743DB; */
    
    }
    
    .lgi {
    background-color:  #343a40;
    }
    
    .lgi:hover {
    background-color: #8d72e1;
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
    .content{
    width: fit-content;
    /* max-height: 100vh; */
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
    .letter-gradient{
        background: linear-gradient(to right ,#8d72e1,#8d9eff, #b9e0ff,#8d9eff,#8d72e1);
        -webkit-text-fill-color: transparent;
        background-clip:text;
    }
    @media  (max-width:480px) {
        
      .d-none{
        display: none;
      }
      .icon1 {
    height: 30px;
    
    }
      

    }
    </style>
    </head>
    
    <body>
         <%@ include file="nav.jsp" %>
        
    
          
         <div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
          
            <div class="container-fluid bg-white content" style=" width:fit-content;">
                    <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 " style="border-radius: 10px;">
                        <!-- Form for add employee -->
                    <form action="#" class="row g-3 "  name="addForm" style="padding: 20px;" onsubmit="return formValidate()">
                        <h1 align="center" class="fs-3 fw-bold" style="color: #8424BC" >ADD EMPLOYEE</h1>
                          <div class="col-md-6">
                              <label for="name" class="form-label">Full Name</label>
                              <input type="text" class="form-control" name="name" id="name">
                              <h6 id="vname"></h6>
                            </div>
                           
                          <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email">
                            <h6 id="vemail"></h6>
                          </div>
                          <div class="col-md-6">
                            <label for="mobile" class="form-label">Mobile No</label>
                            <input type="number" class="form-control" name="mobile" id="mobile">
                            <h6 id="vmobile"></h6>
                          </div>
                          <div class="col-md-6">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" name="dob" id="dob">
                            <h6 id="vdob"></h6>
                          </div>
                          <div class="col-md-6 mt-6 d-flex">
                            <label for="gender" class="form-label">Gender </label>
                            <div>
                            <div class="form-check ms-3">
                              <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="Male" checked>
                              <label class="form-check-label" for="flexRadioDefault1">
                               Male
                              </label>
                            </div>
                            <div class="form-check ms-3">
                              <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="Female" >
                              <label class="form-check-label" for="flexRadioDefault2">
                                Female
                              </label>
                            </div>
                          </div>
                          <h6 id="vgender"></h6>
                          </div>
                          
                          <div class="col-md-6">
                            <label for="doj" class="form-label">Date of Joining</label>
                            <input type="date" class="form-control" name="doj" id="doj" >
                            <h6 id="vdoj"></h6>
                          </div>
                          <div class="col-6">
                            <label for="department" class="form-label">Department</label>
                            <select  class="form-control" name="department" id="department" >
                              <option value="" selected>select department</option>
                              <option value="Human Resources">Human Resources</option>
                              <option value="IT">IT</option>
                              <option value="Accounting/Finance">Accounting and Finance</option>
                              <option value="Marketing">Marketing</option>
                              <option value="R&D"> Research and Development (R&D)</option>
                              <option value="Production"> Production</option>

                            </select>
                            <h6 id="vdepartment"></h6>
                          </div>
                          <div class="col-6">
                            <label for="designation" class="form-label">Designation</label>
                            <select  class="form-control" name="designation" id="designation" >
                              <option value="" selected>select designation</option>
                              <option value="HR Manager">HR Manager</option>
                              <option value="Manager">Dept. Manager</option>
                              <option value="Employee">Employee</option>
                            </select>
                            <h6 id="vdesignation"></h6>
                          </div>
                          <div class="col-12">
                            <label for="address" class="form-label">Address</label>
                            <textarea  class="form-control" name="address" id="address" placeholder="1234 Main St"></textarea>
                            <h6 id="vaddress"></h6>
                          </div>
                          <div class="col-md-4">
                            <label for="state" class="form-label">State</label>
                            <select id="state" name="state" class="form-select">
                            <option value="" selected>select state</option>
                              <option value="Andhra Pradesh">Andhra Pradesh</option>
			                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
			                        <option value="Assam">Assam</option>
			                        <option value="Bihar">Bihar</option>
			                        <option value="Chhattisgarh">Chhattisgarh</option>
			                        <option value="Goa">Goa</option>
			                        <option value="Gujarat">Gujarat</option>
			                        <option value="Haryana">Haryana</option>
			                        <option value="Himachal Pradesh">Himachal Pradesh</option>
			                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
			                        <option value="Jharkhand">Jharkhand</option>
			                        <option value="Karnataka">Karnataka</option>
			                        <option value="Kerala">Kerala</option>
			                        <option value="Madya Pradesh">Madya Pradesh</option>
			                        <option value="Maharashtra">Maharashtra</option>
			                        <option value="Manipur">Manipur</option>
			                        <option value="Meghalaya">Meghalaya</option>
			                        <option value="Mizoram">Mizoram</option>
			                        <option value="Nagaland">Nagaland</option>
			                        <option value="Orissa">Orissa</option>
			                        <option value="Punjab">Punjab</option>
			                        <option value="Rajasthan">Rajasthan</option>
			                        <option value="Sikkim">Sikkim</option>
			                        <option value="Tamil Nadu">Tamil Nadu</option>
			                        <option value="Telangana">Telangana</option>
			                        <option value="Tripura">Tripura</option>
			                        <option value="Uttaranchal">Uttaranchal</option>
			                        <option value="Uttar Pradesh">Uttar Pradesh</option>
			                        <option value="West Bengal">West Bengal</option>
			                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
			                        <option value="Chandigarh">Chandigarh</option>
			                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
			                        <option value="Daman and Diu">Daman and Diu</option>
			                        <option value="Delhi">Delhi</option>
			                        <option value="Lakshadeep">Lakshadeep</option>
			                        <option value="Pondicherry">Pondicherry</option>
                            </select>
                            <h6 id="vstate"></h6>
                            </div>
                          <div class="col-md-4">
                            <label for="city" class="form-label">City</label>
                            <input type="text" class="form-control" name="city" id="city">
                            <h6 id="vcity"></h6>
                          </div>
                          
                          
                          <div class="col-md-4">
                            <label for="zip" class="form-label">Zip</label>
                            <input type="number" class="form-control" name="zip" id="zip">
                            <h6 id="vzip"></h6>
                          </div>
                          
                          <div class="col-12 d-flex justify-content-end">
                            <input type="submit" class="btn text-white w-25 fw-bold"  style="font-size:1.1rem;background-color:#8424BD;border-radius: 25px;" value="Add">
                          </div>
                        </form>
                    </div>
                </div>
            
        
        

       <!-- javascript validation -->
       <script type="text/javascript">
		
       const pp=document.referrer;
		document.getElementById("back").href=pp;   
		
	
        function formValidate(){
          var status=true;
          var name1=document.forms["addForm"]["name"].value;
          var emailcheck=document.forms["addForm"]["email"].value;
        
          var statev=document.forms["addForm"]["state"].value;
          var pcode1=document.forms["addForm"]["zip"].value;
          var cityv=document.forms["addForm"]["city"].value;
          var add1=document.forms["addForm"]["address"].value;
          var desiv=document.forms["addForm"]["designation"].value;
          var deptv=document.forms["addForm"]["department"].value;
          var b= /^[A-Za-z]{1}[A-Za-z0-9._]{2,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,3}$/;
          var dob1=document.forms["addForm"]["dob"].value
          var doj1=document.forms["addForm"]["doj"].value
          var reg=/^[7-9]{1}/;
          var num1=document.forms["addForm"]["mobile"].value
          
          //name
          if(name1.length<3 ){
            document.getElementById("vname").innerHTML="*name should be greater than 3 and less than 16";	
           
            status= false;
            
          }
          else if(!(/^[A-Za-z ]+$/.test(name1))){
            document.getElementById("vname").innerHTML="*name should be character";	
            
            status= false;
          }
          else{
            document.getElementById("vname").innerHTML="";
          }
        //email
          if(!(b.test(emailcheck)) || emailcheck==""){
          document.getElementById("vemail").innerHTML="*please enter valid Email";
          
          status=false; 
        }else{
            document.getElementById("vemail").innerHTML="";
          }
      
        //mobile
          if(!(reg.test(num1))){
            document.getElementById("vmobile").innerHTML="*please enter valid mobile number"	
              
            status=false;
          }
          else if(num1.length!=10){
            document.getElementById("vmobile").innerHTML="*please enter valid mobile number"
             
            status=false;
          }else{
            document.getElementById("vmobile").innerHTML="";
          }
        
          //dob
          var today = new Date();	
          var minAge=22;
          var maxDOB=new Date(today.getFullYear()-minAge,today.getMonth(),today.getDate());
        
          
          var dob2=new Date(dob1);
          if(dob2>maxDOB || dob1==""){
          document.getElementById("vdob").innerHTML="*age should not be less than 22";
         
          status=false;
          }else{
            document.getElementById("vdob").innerHTML="";
          }

          //doj
          var today = new Date();	
         
          var dojmin=new Date(today.getFullYear(),today.getMonth()-1,today.getDate());
          var dojmax=new Date(today.getFullYear(),today.getMonth()+1,today.getDate());
          
          var doj2=new Date(doj1);
          if(doj2<dojmin ){
          document.getElementById("vdoj").innerHTML="*please enter valid doj";
         
          status=false;
          }
         else if(doj2>dojmax ){
          document.getElementById("vdoj").innerHTML="*please enter valid doj";
         
          status=false;
          }
          else if(doj1=="" ){
          document.getElementById("vdoj").innerHTML="*please enter doj";
         
          status=false;
          }
          else{
            document.getElementById("vdoj").innerHTML="";
          }

           
        
        //dept
      
          if(deptv==""){
           document.getElementById("vdepartment").innerHTML="*please choose valid option";
          
           status=false;
          }else{
            document.getElementById("vdepartment").innerHTML="";
          }
          
        //designation
          
          if(desiv==""){
           document.getElementById("vdesignation").innerHTML="*please choose valid option";
           
           status=false;
          }else{
            document.getElementById("vdesignation").innerHTML="";
          }
        
          //address
          if(add1.length<6 || add1==""){
             document.getElementById("vaddress").innerHTML="*address should be greater than 6";	

             status=false;
          }else{
            document.getElementById("vaddress").innerHTML="";
          }
          
        
          //city
          if(cityv==""){
           document.getElementById("vcity").innerHTML="*please enter city name";
          
           status=false;
          }
          else if(!(/^[A-Za-z ]+$/.test(cityv))){
             document.getElementById("vcity").innerHTML="*please enter valid city name";
            
             status=false;
            }else{
            document.getElementById("vcity").innerHTML="";
          }
          //pcode
          
          if(pcode1.length!=6 || pcode1==""){
           document.getElementById("vzip").innerHTML="*please enter valid zip code";
           
           status=false;
          }else{
            document.getElementById("vzip").innerHTML="";
          }
      
          //state
          if(statev==""){
           document.getElementById("vstate").innerHTML="*please choose valid option";
           
           status=false;
          }else{
            document.getElementById("vstate").innerHTML="";
          }
          
          return status;
        }
        </script>
        


    </body>
    </html>