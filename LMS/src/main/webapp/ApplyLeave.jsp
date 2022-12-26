 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
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

    <div >
    <%@ include file="nav.jsp" %>

        <div class="fbody">
           
        <div >
        <div class="mt-2 d-flex justify-content-end  w-75" style="margin-left: 15%;">
        	<div class="">
                <span class="badge p-2" style="background-color: #8424BD;border-radius: 20px"><a href="BalanceLeave.jsp" class="text-white" style="text-decoration: none;"  >Leave Balance</a>
                </span>
                <span class="badge p-2" style="background-color: #8424BD;border-radius: 20px"><a href="BalanceLeave.jsp" class="text-white" style="text-decoration: none;"  >Leave History</a>
                </span>
            </div>
		</div>
        <div class="mt-4" style="float:left;">
            <a href="ManagerDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
            <div class="container-fluid content" style=" width:fit-content;">
                     <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 scroll1 " style="padding:10px 70px;border-radius: 10px;">
                    <form action="add" class="row g-3 needs-validation"  name="addForm" style="padding: 20px; padding-top: 0;" onsubmit="return formValidate()">
                        <h1 align="center" style="color: #8424BC;">Apply Leave</h1>
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
                            
                            <div class="col-12">
                                <label for="message" class="form-label">Message</label>
                                <textarea  class="form-control" name="message" id="message" placeholder=""></textarea>
                                <h6 id="vmessage"></h6>
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
                                <input type="number" class="form-control" name="tdays" id="tdays" disabled>
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
        
        document.getElementById("tdays").value=dds;    
      
        }
      function formValidate(){
		
        var status=true;
        var reason=document.getElementById("lname").value;
        var t_date1=document.forms["addForm"]["t_date"].value;
        var f_date1=document.forms["addForm"]["f_date"].value; 
        
        var to1=new Date(t_date1);
        var from1=new Date(f_date1);
        var today=new Date(); 
        var day = new Date(t_date1).getUTCDay();
        var day2 = new Date(f_date1).getUTCDay();

        

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
        else if(to1<=today){
            document.getElementById("vt_date").innerHTML="*date should not be previous";
            status=false;
        }
        else if([6,0].includes(day)){
          document.getElementById("vt_date").innerHTML="please choose working day";
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
        else if(to1>=from1){
            document.getElementById("vf_date").innerHTML="*please enter valid date";
            status=false;
        }
        else if([6,0].includes(day2)){
          document.getElementById("vf_date").innerHTML="please choose working day";
          status=false;
        }
        else{
              document.getElementById("vf_date").innerHTML="";
              
            }
        
        
        return status;
      }

     
      </script> 
    


</body>
</html>