<%-- 
    Document   : teacher_delete
    Created on : 2 Jan, 2018, 2:12:23 PM
    Author     : USER
--%>

<%@page import="java.sql.DriverManager"%>
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
out.println(id);

        %><%
        Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
Statement stmt = con.createStatement();
stmt.execute("delete from t_userpass where t_id="+id);

out.println("<script type=\"text/javascript\">");
out.println("alert('deleted successfully ');");
out.println("</script>");
RequestDispatcher rd;
rd =request.getRequestDispatcher("teacherTable.jsp");
rd.include(request, response);  
%>
    </body>
</html>
