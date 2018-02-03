<%@ page language ="java" import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%
String uname=request.getParameter("username");
String pass=request.getParameter("password");

try{

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite", "root", "root123");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select uname,pass from teacherinfo");
    while(rs.next())
    {
        String userid=rs.getString(1);
        String password=rs.getString(2);
        if(uname.equals(uname) && pass.equals(pass))
        {
            out.println("welcome");

            %>
            <jsp:forward page="./studDashboard.html"/>
        <%}
    }
}catch(Exception e1)
{e1.printStackTrace();}

%>