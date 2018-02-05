<%-- 
    Document   : t_personal_display
    Created on : 22 Jan, 2018, 11:33:22 AM
    Author     : USER
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets1/js/fetch.js"></script>
    <script src="assets1/js/promise.js"></script>
    <script src="/sw.js"></script>
        <script src="assets1/js/app1.js"><script>

    </head>
    <body>
         <%
       
    String id1=request.getParameter("i");
int id=Integer.parseInt(id1);
session=request.getSession();
session.setAttribute("i",id);
        %>
         <div class="card-body table-full-width table-responsive">
                                  <form method="get" name="form">
                                    <table class="table table-hover table-striped" style=\"width:100%\"  align="center" border="1" >
                                        <thead>
                                             <th>ID</th>
                                            <th>FNAME</th>
                                            <th>LNAME</th>
                                            <th>ADDRESS</th>
                                            <th>PERMANENT_ADDRESS</th>
                                            <th>MOBILE</th>
                                             <th>EMAIL</th>
                                             <th>BIRTHDATE</th>
                                             <th>GENDER</th>
                                            
                                           
                                          
                                        </thead>
                                        <tbody>
       <% Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select t_id,t_fname,t_lname,t_address,t_permanet_address,t_mobile,t_email,t_birthdate,t_gender from t_registration where t_id="+id);
%>
 <%
        while(rs.next())
        {
 %>
        <tr>
            <td> <%=rs.getInt(1)%> </td>
            <td> <%=rs.getString(2)%> </td>
            <td> <%=rs.getString(3)%> </td> 
             <td> <%=rs.getString(4)%> </td>
            <td> <%=rs.getString(5)%> </td> 
            <td> <%=rs.getInt(6)%> </td>
            <td> <%=rs.getString(7)%> </td>
            <td> <%=rs.getString(8)%> </td> 
             <td> <%=rs.getString(9)%> </td> 
              
        </tr>
        <%
        }
        %>

                                        </tbody>

                                    </table>
                                    </form>
    </body>
</html>
