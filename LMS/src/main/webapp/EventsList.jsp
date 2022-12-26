<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  margin-right: 13px;
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
           
                
                
                <div>
                    <h3 style="color:#8424BC">Holiday's List</h3>
                    <table class="table table-striped" >
                        <thead>
                      <tr>
                        <th >Date</th>
                        <th >Holiday</th>
                        <th >Day</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td >1 January</td>
                        <td>New Year's Day</td>
                        <td>Sunday</td>
                      </tr>
                      <tr>
                        <td>14 January</td>
                        <td>Sankranthi</td>
                        <td>Saturday</td>
                      </tr>
                      <tr>
                        <td>15 January</td>
                        <td>Pongal</td>
                        <td>Sunday</td>
                      </tr>
                      <tr>
                        <td>26 January</td>
                        <td>Republic Day</td>
                        <td>Thrusday</td>
                      </tr>
                      
                      <tr>
                        <td>18 February</td>
                        <td>Maha Shivaratri</td>
                        <td>Saturday</td>
                      </tr>
                      <tr>
                        <td>8 March</td>
                        <td>Holi</td>
                        <td>Wednesday</td></tr>
                      </tr>
                      <tr>
                        <td>22 March</td>
                        <td>Gudi Padwa</td>
                        <td>Wednesday</td>
                      </tr>
                       <tr>
                        <td>30 March</td>
                        <td>Ram Navami</td>
                        <td>Thrusday</td>
                      </tr>
                      <tr>
                        <td>4 April</td>
                        <td>Mahavir Jayanti</td>
                        <td>Tuesday</td>
                      </tr>
                      <tr>
                        <td>7 April</td>
                        <td>Good Friday</td>
                        <td>Friday</td>
                      </tr>
                      
                      <tr>
                        <td>5 May</td>
                        <td>Buddha Purnima</td>
                        <td>Friday</td>
                      </tr>
                      <tr>
                        <td>29 June</td>
                        <td>Bakrid</td>
                        <td>Thrusday</td>
                      </tr>
                      <tr>
                        <td>29 July</td>
                        <td>Muharram</td>
                        <td>Saturday</td>
                      </tr>
                         
                      <tr>
                        <td>15 August</td>
                        <td>Independence Day</td>
                        <td>Monday</td>
                      </tr>
                      <tr>
                        <td>31 August</td>
                        <td>Raksha Bandhan</td>
                        <td>Thrusday</td>
                      </tr>
                      <tr>
                        <td>7 September</td>
                        <td>Janmashtami</td>
                        <td>Thrussday</td>
                      </tr>
                      <tr>
                        <td>19 September</td>
                        <td>Ganesh Chaturthi</td>
                        <td>Tuesday</td>
                      </tr>
                      <tr>
                        <td>2 October</td>
                        <td>Gandhi Jayanti</td>
                        <td>Monday</td>
                      </tr>
                      <tr>
                        <td>23 October</td>
                        <td>Maha Navami</td>
                        <td>Monday</td>
                      </tr>
                      <tr>
                        <td>12 November</td>
                        <td>Diwali</td>
                        <td>Sunday</td>
                      </tr>
                      <tr>
                        <td>27 November</td>
                        <td>Guru Nanak Jayanti</td>
                        <td>Monday</td>
                      </tr>
                      <tr>
                        <td>25 December</td>
                        <td>Christmas Day</td>
                        <td>Monday</td>
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