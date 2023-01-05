 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply Leave</title>
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

padding: 0% 10%;
}
.scroll1{
  height:80vh;
  overflow: scroll;
}
.scroll1::-webkit-scrollbar{
    display: none;
}
h6{
  color: red;
  font-size: 12px;
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
          <a class="navbar-brand ms-2 " style="color: #8424bd; font-size: 1.4rem;" href="dashboardE?empid=${empid}"><b>Leave Management</b></a>
          <div class="d-flex">
         <a href="dashboardE?empid=${empid}" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-houses-fill logicon"></i><span style="color: #8424BC;">Home</span></a>
             <a href="logout" class="navbar-brand " style=" display: flex; color: #f9fafb;font-size: 18px;" >
                 <i class="bi bi-box-arrow-left logicon"></i><span class="" style="color: #8424BC;">Logout</span></a>
         </div>
          </div>
      </nav>

        <div class="fbody">
           
        <div >
        <div class="mt-2 d-flex justify-content-end  w-75" style="margin-left: 15%;">
        	<div class="">
                <a href="viewbalanceleave?empid=<c:out value='${employee.empid}'/>" class="btn btn-purple " style="text-decoration: none;font-size: 1.1rem;border-radius: 25px">Leave Balance</a>                               
                <a href="empbalhistoryE?empid=<c:out value='${employee.empid}'/>" class="btn btn-purple " style="text-decoration: none;font-size: 1.1rem;border-radius: 25px">Leave History</a>                               
                 
            </div>
		</div>
        <div class="mt-4" style="float:left;">
            <a href="EmployeeDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
            <div class="container-fluid content" style=" width:fit-content;">
                     <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 scroll1 " style="padding:10px 70px;border-radius: 10px;">
                    <form action="leaveemp" class="row g-3 needs-validation"  name="addForm" style="padding: 20px; padding-top: 0;" onsubmit="return formValidate()">
                        <h1 align="center" style="color: #8424BC;">Apply Leave</h1>
                        
                        <div class="col-md-6">
                              <label for="empid" class="form-label">Employee ID</label>
                              <input type="number" class="form-control" name="empid" value="${employee.empid}" id="empid" readonly="readonly" >
                              <h6 id="vemid"></h6>
                            </div>
                          <div class="col-md-6">
                              <label for="name1" class="form-label">Employee Name</label>
                              <input type="text" class="form-control" name="name" value="${employee.name}" id="name1" readonly="readonly" >
                              <h6 id="vname"></h6>
                            </div>
                        
                        <div class="col-12">
                            <label for="lname" class="form-label">Leave Reason</label>
                            <select  class="form-control" name="lname" id="lname" >
                              <option value="" selected>Select leave reason</option>
                              
                              <option value="Sick Leave">Sick Leave</option>
                              <option value="Casual Leave">Casual Leave</option>
                              <option value="Personal Leave">Personal Leave</option>
                              <option value="Maternity Leave">Maternity Leave</option>
                              <option value="Paternity Leave">Paternity Leave</option>
                              <option value="Marriage Leave">Marriage Leave</option>
                              <option value="Adoption Leave">Adoption Leave</option>

                            </select>
                            <h6 id="vlname"></h6>
                          </div>
                            
                          

                              <div class="col-md-6">
                                <label for="t_date" class="form-label">Start Date</label>
                                <input type="date" class="form-control" name="t_date" id="t_date"  onblur=" return getTDays()" >
                              
                                <h6 id="vt_date"></h6>
                              </div>
                              
                              <div class="col-md-6">
                                <label for="f_date" class="form-label">End Date</label>
                                <input type="date" class="form-control" name="f_date" id="f_date" onblur=" return getTDays()">
                                <h6 id="vf_date"></h6>
                              </div>

                              <div class="col-md-6">
                                <label for="tdays" class="form-label">Total Leave Days</label>
                                <input type="number" class="form-control" name="tdays" id="tdays" readonly="readonly">
                                <h6 id="vtdays"></h6>
                              </div>

                              <div class="col-12 d-flex " style="justify-content:space-between">
                            
                          	<input type="submit" class="btn text-white w-25 fw-bold"  style="font-size:1.1rem;background-color:#8424BD;border-radius: 25px;" value="Apply">
                          
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
   		
      function getTDays(){
         
        	
        var t_date1=document.forms["addForm"]["t_date"].value;
        var f_date1=document.forms["addForm"]["f_date"].value;
        var f_date1=document.forms["addForm"]["f_date"].value;
        var reason=document.getElementById("lname").value;
        var to1=new Date(t_date1);
        var from1=new Date(f_date1);
        weekend=false;
        // tds is time difference and dds is day difference between two dates
        //1 second=1000 milliseconds
        var tds=from1.getTime()-to1.getTime();
        var dds=tds/(1000*60*60*24)+1;  
        while(to1<from1){
          var day=to1.getDay();
          weekend=(day==6) || (day==0);
          if(weekend){
           dds= dds-1
          }
          to1.setDate(to1.getDate()+1);
        }
        if(dds>=1){
         document.getElementById("tdays").value=dds;    
        }
        else{
          document.getElementById("tdays").value=null;  
        }
        
        }
      function formValidate(){
		
        var status=true;
   	   
        var reason=document.getElementById("lname").value;
        var t_date1=document.forms["addForm"]["t_date"].value;
        var f_date1=document.forms["addForm"]["f_date"].value; 
       
        var to1=new Date(t_date1);
        var from1=new Date(f_date1);
        var today=new Date().setHours(0,0,0,0); 
        var day3 = new Date(t_date1).getUTCDay();
        var day2 = new Date(f_date1).getUTCDay();

        weekend=false;
        // tds is time difference and dds is day difference between two dates
        //1 second=1000 milliseconds
        var tds=from1.getTime()-to1.getTime();
        var dds=tds/(1000*60*60*24)+1;  
        while(to1<from1){
          var day=to1.getDay();
          weekend=(day==6) || (day==0);
          if(weekend){
           dds= dds-1
          }
          to1.setDate(to1.getDate()+1);
        }
        

        //leave reason

        if(reason==""){
            document.getElementById("vlname").innerHTML="*please choose valid reason";
            status=false;
        }else{
            document.getElementById("vlname").innerHTML="";
            
        }

        //form date 

        if(t_date1==""){
            document.getElementById("vt_date").innerHTML="*please enter date";
            status=false;
            }
        else if(to1<today){
            document.getElementById("vt_date").innerHTML="*date should not be previous";
            status=false;
        }
        else if([6,0].includes(day3)){
          document.getElementById("vt_date").innerHTML="*please choose working day";
          status=false;
        }
        else{
              document.getElementById("vt_date").innerHTML="";
            }
        
        // to Date
        if(f_date1==""){
            document.getElementById("vf_date").innerHTML="*please enter date";
            status=false;
            }
        else if(to1>from1){
            document.getElementById("vf_date").innerHTML="*please enter valid date";
            status=false;
        }
        else if([6,0].includes(day2)){
          document.getElementById("vf_date").innerHTML="*please choose working day";
          status=false;
        }
        
        
            
        else if((reason=="Sick Leave" || reason=="Casual Leave" || reason=="Personal Leave" || reason=="Marriage Leave") && dds>15){
          document.getElementById("vf_date").innerHTML="* selected leave should be less than 15 days";
          status=false;
        }
        else if((reason=="Paternity Leave" || reason=="Adoption Leave") && dds>30){
          document.getElementById("vf_date").innerHTML="*selected leave should be less than 30 days";
          status=false;
        }
        else if(reason=="Maternity Leave" && dds>180){
          document.getElementById("vf_date").innerHTML="*selected leave should be less than 180 days";
          status=false;
        }
       else{
          document.getElementById("vf_date").innerHTML="";
        }
        
        if(reason=="Maternity Leave" && dds>${bleave.maternityleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.maternityleave}+" Maternity Leaves left.";
        	status=false;
        }
        else if(reason=="Paternity Leave" && dds>${bleave.paternityleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.paternityleave}+" "+reason+" left.";
        	status=false;
        }
        else if(reason=="Adoption Leave" && dds>${bleave.adoptionleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.adoptionleave}+" "+reason+" left.";
        	status=false;
        }
        else if(reason=="Sick Leave" && dds>${bleave.sickleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.sickleave}+" "+reason+" left.";
        	status=false;
        } 
        else if(reason=="Casual Leave" && dds>${bleave.casualleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.casualleave}+" "+reason+" left.";
        	status=false;
        }
        else if(reason=="Personal Leave" && dds>${bleave.personalleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.personalleave}+" "+reason+" left.";
        	status=false;
        }
        else if(reason=="Marriage Leave" && dds>${bleave.marriageleave}){
        	document.getElementById("vtdays").innerHTML="*You have only "+${bleave.marriageleave}+" "+reason+" left.";
        	status=false;
        }
        else{
        	document.getElementById("vtdays").innerHTML="";
        }
        
        
        
        return status;
        
      }

     
      </script> 
    
    
    


</body>
</html>