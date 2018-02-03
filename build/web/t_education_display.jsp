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
                                            <th>SCHOOL_NAME</th>
                                            <th>SSC</th>
                                            <th>SSC_PASSING YEAR</th>
                                            <th>HSC_COOLLEGE NAME</th>
                                            <th>HSC</th>
                                             <th>HSC_PASSING YEAR</th>
                                             <th>UG_COOLEGE NAME</th>
                                             <th>UG_DEPT</th>
                                             <th>UG_FE</th>
                                             <th>UG_SE</th>
                                             <th>UG_TE</th>
                                             <th>UG_BE</th>
                                             <th>UG_PASSING YEAR</th>
                                             <th>PG_COLLEGE NAME</th>
                                             <th>PG_DEPT</th>
                                             <th>PG_FE</th>
                                             <th>PG_SE</th>
                                              <th>PG_PASSING YEAR</th>
                                            
                                           
                                          
                                        </thead>
                                        <tbody>
       <% Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from t_education where t_id="+id);
%>
 <%
        while(rs.next())
        {
 %>
        <tr>
            <td> <%=rs.getInt(1)%> </td>
            <td> <%=rs.getString(2)%> </td>
             <td> <%=rs.getInt(3)%> </td>
              <td> <%=rs.getInt(4)%> </td>
            <td> <%=rs.getString(5)%> </td> 
             <td> <%=rs.getInt(6)%> </td>
              <td> <%=rs.getInt(7)%> </td>
             <td> <%=rs.getString(8)%> </td>
            <td> <%=rs.getString(9)%> </td> 
            <td> <%=rs.getInt(10)%> </td>
             <td> <%=rs.getInt(11)%> </td>
             <td> <%=rs.getInt(12)%> </td>
              <td> <%=rs.getInt(13)%> </td>
               <td> <%=rs.getInt(14)%> </td>
            <td> <%=rs.getString(15)%> </td>
            <td> <%=rs.getString(16)%> </td> 
              <td> <%=rs.getInt(17)%> </td>
               <td> <%=rs.getInt(18)%> </td>
                <td> <%=rs.getInt(19)%> </td>
              
        </tr>
        <%
        }
        %>

                                        </tbody>

                                    </table>
                                    </form>
    </body>
</html>
