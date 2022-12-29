 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="ISO-8859-1">
    <title>Add Project</title>
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
    background-color: #8d72e1;
    }
    .icon1 {
    height: 17px;
    margin-right: 13px;
    color: #f9fafb;
    }
    .logicon {
    height: 17px;
    margin-right: 10px;
    color: #8424bd;
    
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
    
        <!-- <div >
        <div class="nav1"> -->
     	 <%@ include file="nav.jsp" %>
            <!-- </div> -->
    
            <!-- <div class="fbody"> -->
                
                
             <div >
			<div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
                <div class="container-fluid content" style=" width:fit-content;">
                    <div class="col bg-light border border-1 shadow-sm mt-3 mb-3" style="border-radius: 10px;">
                    <form action="addproject" class="row g-3 needs-validation"  name="addForm" style="padding: 20px;" onsubmit="return formValidate()">
                        <h1 align="center"  class="fs-3 fw-bold " style="color: #8424bd;">Add Project</h1>
                          <div class="col-md-6">
                              <label for="name" class="form-label">Project Name</label>
                              <input type="text" class="form-control" name="name" id="name" >
                              <h6 id="vname"></h6>
                            </div>
                            
                             <div class="col-md-6">
                                <label for="assigned_to" class="form-label">Assigned to</label>
                                <select  class="form-control" name="assigned_to" id="assigned_to" >
                                  <!-- <option value="" selected>Select employee name</option> -->
                                  <c:forEach items="${employee}" var="employee" > 
                                  <option value="${employee.name }">${employee.name}</option>
    								</c:forEach>
                                </select>
                                <h6 id="vaassigned_to"></h6>
                              </div>
                            
                            <div class="col-12">
                                <label for="description" class="form-label">Description</label>
                                <textarea  class="form-control" name="description" id="description" placeholder=""></textarea>
                                <h6 id="vdescription"></h6>
                              </div>

                             

                              <!-- <div class="col-6">
                                <label for="pstatus" class="form-label">Project Status</label>
                                <select  class="form-control" name="pstatus" id="pstatus" disabled>
    
                                  <option value="Pending" selected>Pending</option>
                                  <option value="In Progress">In Progress</option>
                                  <option value="Completed">Completed</option>
                                  
                                </select>
                                <h6 id="vstatus"></h6>
                              </div> -->

                              <div class="col-md-6">
                                <label for="s_date" class="form-label">Start Date</label>
                                <input type="date" class="form-control" name="s_date" id="s_date" >
                                <h6 id="vs_date"></h6>
                              </div>
                              <div class="col-md-6">
                                <label for="e_date" class="form-label">End Date</label>
                                <input type="date" class="form-control" name="e_date" id="e_date" >
                                <h6 id="ve_date"></h6>
                              </div>
                              
                              <div class="col-12 d-flex justify-content-end">
                                <input class="form-control btn w-25 text-white fw-bold" style="background-color: #8424bd;border-radius:20px;"  type="submit" value="Add">
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
            var name1=document.forms["addForm"]["name"].value;
            var description1=document.forms["addForm"]["description"].value;
          
            var assigned_to1=document.forms["addForm"]["assigned_to"].value;
            var s_date1=document.forms["addForm"]["s_date"].value;
            var e_date1=document.forms["addForm"]["e_date"].value;
           
            
            
            //name
            if(name1.length<3 ){
              document.getElementById("vname").innerHTML="*project name should be greater than 3 ";	
              status= false;
 
            }
            else if(!(/^[A-Za-z ]+$/.test(name1))){
              document.getElementById("vname").innerHTML="*project name should be character";	
              
              status= false;
            }
            else{
              document.getElementById("vname").innerHTML="";
            }
         
            //description
            if(description1.length<6 || description1==""){
                document.getElementById("vdescription").innerHTML="*descriptions should be greater than 6";	

                status=false;
                }else{
                document.getElementById("vdescription").innerHTML="";
                }
            

            //Assigned to
        
            if(assigned_to1==""){
             document.getElementById("vaassigned_to").innerHTML="*please choose valid option";
            
             status=false;
            }else{
              document.getElementById("vaassigned_to").innerHTML="";
            }
          
            //start date
            var today = new Date();	
            var sdate=new Date(s_date1);
            
            
            if(s_date1==""){
            document.getElementById("vs_date").innerHTML="*please enter start date";
            status=false;
            }
           else if(sdate<today){
            document.getElementById("vs_date").innerHTML="*start date should not be previous";
            status=false;
            }else{
              document.getElementById("vs_date").innerHTML="";
            }

            //end date
            var today = new Date();	
            var edate=new Date(e_date1);
            var endd=new Date(today.getFullYear(),today.getMonth()+1,today.getDate());
            if(e_date1==""){
            document.getElementById("ve_date").innerHTML="*please enter end date";
            status=false;
            }
            else if(edate>endd){
            document.getElementById("ve_date").innerHTML="*project duration should not exceed 1 month";
            status=false;
            }   
            else if(sdate>=edate){
            document.getElementById("ve_date").innerHTML="*end date should not be less than start date";
            status=false;
            }      
            else{
            document.getElementById("ve_date").innerHTML="";
            }
          
         
            return status;
          }
          </script> 
        
        

    </body>
    </html>