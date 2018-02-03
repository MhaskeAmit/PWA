<%-- 
    Document   : teacher_update
    Created on : 2 Jan, 2018, 2:11:55 PM
    Author     : USER
--%>

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
        
         <form action="teacher_update1">
          
          USERNAME <input type="text" name="uname" value="" size="20" /><br>
          PASSWORD  <input type="text" name="pass" value="" size="20" /><br>
                    <br>
          <input type="submit" value="update" name="update" />
        </form>
    </body>
</html>
