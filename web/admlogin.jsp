<%@ page language ="java" import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%
String username=request.getParameter("username");
String passwrd=request.getParameter("password");

try{

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite", "root", "root123");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select username,password from admin");
    while(rs.next())
    {
        String userid=rs.getString(1);
        String password=rs.getString(2);
        if(username.equals(username) && passwrd.equals(password))
        {
            out.println("welcome");

            %>
            <jsp:forward page="dashboard.html"/>
        <%}
    }
}catch(Exception e1)
{e1.printStackTrace();}

%>