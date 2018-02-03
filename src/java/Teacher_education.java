/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author USER
 */
public class Teacher_education extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          String id1=request.getParameter("id");
             int teacherid=Integer.parseInt(id1);
            //out.println(id1);
            
            String sname=request.getParameter("sname");
            //out.println(sname);
             String ssc1=request.getParameter("ssc");
             int ssc=Integer.parseInt(ssc1);
            //out.println(ssc);
             String passing=request.getParameter("p_yr");
             int p_yr=Integer.parseInt(passing);
            //out.println(p_yr);
            
                String clg=request.getParameter("clg_name");
              //  out.println(clg);
                String hsc1=request.getParameter("hsc");
                int hsc=Integer.parseInt(hsc1);
                //out.println(hsc);
                String passing_yr=request.getParameter("passing_yr");
                int pass_yr=Integer.parseInt(passing_yr);
                //out.println(pass_yr);

             String cname=request.getParameter("cname");
             //out.println(cname);
             String dept=request.getParameter("dept");
             //out.println(dept);
             String fe1=request.getParameter("fe");
              int fe=Integer.parseInt(fe1);
              //out.println(fe);
               String se1=request.getParameter("se");
              int se=Integer.parseInt(se1);
              //out.println(se);
               String te1=request.getParameter("te");
              int te=Integer.parseInt(te1);
              //out.println(te);
               String be1=request.getParameter("be");
              int be=Integer.parseInt(be1);
              //out.println(be);
              String year1=request.getParameter("year");
              int year=Integer.parseInt(year1);
              //out.println(year);
             
              
              String c_name=request.getParameter("c_name");
                //out.println(c_name);
                String dep=request.getParameter("dep");
                //out.println(dep);
                String f_yr1=request.getParameter("f_yr");
                int f_yr=Integer.parseInt(f_yr1);
                //out.println(f_yr);
                 String s_yr1=request.getParameter("s_yr");
                int s_yr=Integer.parseInt(s_yr1);
                //out.println(s_yr);
                String py1=request.getParameter("pass");
                int py=Integer.parseInt(py1);
                //out.println(py);

            
            
              Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
PreparedStatement prmst=con.prepareStatement("insert into t_education values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
prmst.setInt(1, teacherid);
prmst.setString(2, sname);
prmst.setInt(3, ssc);
prmst.setInt(4, p_yr);

prmst.setString(5, clg);
prmst.setInt(6, hsc);
prmst.setInt(7, pass_yr);

prmst.setString(8, cname);
prmst.setString(9, dept);
prmst.setInt(10, fe);
prmst.setInt(11, se);
prmst.setInt(12, te);
prmst.setInt(13, be);
prmst.setInt(14, year);

prmst.setString(15, c_name);
prmst.setString(16, dep);
prmst.setInt(17, f_yr);
prmst.setInt(18, s_yr);
prmst.setInt(19, py);


int r=prmst.executeUpdate();
if (r>0)
{ 
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ADDED SUCCESSFULLY !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("TeacherUserpass.html");
                     rd.include(request, response);
}
else
{
out.println("<script type=\"text/javascript\">");
                    out.println("alert('DATA NOT ADDED !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("Teacher_edu.html");
                     rd.include(request, response);

}
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Teacher_education.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Teacher_education.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Teacher_education.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Teacher_education.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
