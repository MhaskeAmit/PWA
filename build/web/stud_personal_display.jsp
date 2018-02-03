<%-- 
    Document   : stud_personal_display
    Created on : 22 Jan, 2018, 10:25:56 PM
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
ResultSet rs=st.executeQuery("select s_roll,s_fname,s_lname,s_add,s_prmnt_add,s_mobile,s_email,s_bdate,s_gen from s_personal where s_roll="+id);
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
