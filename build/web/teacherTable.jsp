<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"  content=""/>
    <link rel="apple-touch-icon" sizes="76x76" href="assets8/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets8/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Educational System</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets8/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets8/css/light-bootstrap-dashboard.css?v=2.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets8/css/demo.css" rel="stylesheet" />
 <script>
            
            function personal(i)
            {
               
                var f=document.form;      
                     f.method="post";
                     f.action='t_personal_display.jsp?i='+i;
                     f.submit();
            }
            function edu(i)
            {
                
                var f=document.form;      
                     f.method="post";
                     f.action='t_education_display.jsp?i='+i;
                     f.submit();
            }
            function up(i)
            {
                
                var f=document.form;      
                     f.method="post";
                     f.action='teacher_update.jsp?i='+i;
                     f.submit();
            }
             function del(i)
            {
                
                var f=document.form;      
                     f.method="post";
                     f.action='teacher_delete.jsp?i='+i;
                     f.submit();
            }
        </script>
</head>

   <body>

    <div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-4.jpg">

            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag

    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http:\\google.com" class="simple-text">
                        <i class="nc-icon nc-backpack"></i>
                        Educational System
                    </a>
                </div>
                
                <ul class="nav">
                    <li>
                        <a class="nav-link" href="dashboard.html">
                            <i class="nc-icon nc-grid-45"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    
                    <li class="nav-item active">
                        <a class="nav-link" href="./teacherTable.jsp">
                            <i class="nc-icon nc-notes"></i>
                            <p>Teacher Information</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="studTable.jsp">
                                <i class="nc-icon nc-ruler-pencil"></i>
                            <p>Student Information</p>
                        </a>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="./notifications.html">
                            <i class="nc-icon nc-bell-55"></i>
                            <p>Notifications</p>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
             <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class=" container-fluid  ">
                    <a class="navbar-brand" href="#pablo">
                        <i class="nc-icon nc-single-02"></i> Teacher Information </a>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                    <span class="d-lg-none">Teacher Information</span>
                                
                            </li>
                         
                            
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Notification</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Not 2</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div></nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card striped-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">TEACHER INFORMATION </h4>
                                    
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                  <form method="get" name="form">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                             <th>ID</th>
                                            <th>UNAME</th>
                                            <th>PASSWORD</th>
                                             <th>PERSONAL</th>
                                             <th>EDUCATION</th>
                                           <th>UPDATE</th>
                                             <th>DELETE</th>
                                          
                                        </thead>
                                        <tbody>
<% Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from t_userpass");
%>
 <%
        while(rs.next())
        {
 %>
        <tr>
            <td> <%=rs.getInt(1)%> </td>
            <td> <%=rs.getString(2)%> </td>
            <td> <%=rs.getString(3)%> </td> 
            
               <td><input type="submit" value="personal_info" onclick="personal(<%=rs.getInt(1)%>)"</td>
            <td><input type="submit" value="education_info" onclick="edu(<%=rs.getInt(1)%>)"</td>
                        <td><input type="submit" value="update" onclick="up(<%=rs.getInt(1)%>)"</td>
            <td><input type="submit" value="delete" onclick="del(<%=rs.getInt(1)%>)"</td>

        </tr>
        <%
        }
        %>

                                        </tbody>

                                    </table>
                                    </form>

                                  
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card card-plain table-plain-bg">
                               
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           <footer class="footer">
                <div class="container">
                    <nav>
                        <ul class="footer-menu">
                            
                        </ul>
                        <p class="copyright text-center">
                            �
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="http://www.google.com">Edu Lite - Education System</a>
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
    <!--   -->
    <!-- <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>

        <ul class="dropdown-menu">
			<li class="header-title"> Sidebar Style</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Background Image</p>
                    <label class="switch">
                        <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary"><span class="toggle"></span>
                    </label>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger background-color">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter badge-black" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>

            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-1.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-3.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="..//assets/img/sidebar-4.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-5.jpg" alt="" />
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard" target="_blank" class="btn btn-info btn-block btn-fill">Download, it's free!</a>
                </div>
            </li>

            <li class="header-title pro-title text-center">Want more components?</li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard-pro" target="_blank" class="btn btn-warning btn-block btn-fill">Get The PRO Version!</a>
                </div>
            </li>

            <li class="header-title" id="sharrreTitle">Thank you for sharing!</li>

            <li class="button-container">
				<button id="twitter" class="btn btn-social btn-outline btn-twitter btn-round sharrre"><i class="fa fa-twitter"></i> � 256</button>
                <button id="facebook" class="btn btn-social btn-outline btn-facebook btn-round sharrre"><i class="fa fa-facebook-square"></i> � 426</button>
            </li>
        </ul>
    </div>
</div>
 -->
 
 </body>
<!--   Core JS Files   -->
<script src="assets8/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets8/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets8/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets8/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="assets8/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets8/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets8/js/light-bootstrap-dashboard.js?v=2.0.1" type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets8/js/demo.js"></script>

</html>