<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Holiday</title>
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
  /* i{
    align-content: center;
    font-size: 200%;
  } */
  .lgi{
    height: fit-content;
  }
}
</style>
</head>

<body>
  <%@ include file="nav.jsp" %>
        

        <div class="fbody">
            <div class="mt-4" style="float:left;">
            <a href="AdminDashboard.jsp" id="back" class="navbar-brand" style="display: flex;color:#8424bd">
             <i class="bi bi-arrow-left-circle-fill "></i></a>
             </div>
           <div class="container-fluid bg-white content" style=" width:fit-content;">
        	 <div class="col mt-4 mb-4 shadow-sm bg-light border border-1 " style="padding:70px;border-radius: 10px;">
           <form action="addevent">
                <div class="row">
                    <div class="col-md-4">
                        <input type="date" class="form-control" name="hdate" id="hdate" >
                        <h6 id="hdate"></h6>
                      </div>
                      <div class="col-md-4">
                        <input type="text" class="form-control" name="hname" id="hname" placeholder="event name">
                        <h6 id="hname"></h6>
                      </div>
                      <div class="col-md-4">
                    <input type="submit" class="btn text-white" value="Add Event"style=" border-radius:20px;background-color: #8424BC;">
                </div>
                </div> 
                <hr>
               </form>
                <div>
                    <h3 class="my-4" style="color:#8424BC">Holiday's List</h3>
                    <table class="table table-striped" >
                        <thead>
                      <tr>
                        <th >Date</th>
                        <th >Holiday</th>
                        <th >Day</th>
                      </tr>
					</thead>
					<tbody>
                    <c:forEach items="${holiday}" var="holiday" > 
                    
                      <tr>
                        <td >${holiday.hdate}</td>
                        <td>${holiday.hname}</td>
                        <td>${holiday.hday}</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                    </table>
                      </div>
            </div>
        </div>
        </div>
  

    <!-- javascript validation -->
    <script type="text/javascript">
   
      </script> 
    


</body>
</html>