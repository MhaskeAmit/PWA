/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
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

/**
 *
 * @author USER
 */
public class stud_education extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String id1=request.getParameter("s_roll");
             int s_roll=Integer.parseInt(id1);
            //out.println(id1);
            
            String s_school=request.getParameter("s_school");
            //out.println(sname);
             String ssc1=request.getParameter("s_ssc");
             int s_ssc=Integer.parseInt(ssc1);
            //out.println(ssc);
             String s_ssc_passyear=request.getParameter("s_ssc_passyear");
            // int s_ssc_passyear=Integer.parseInt(passing);
           // out.println(p_yr);
            
                String s_hsc_college=request.getParameter("s_hsc_college");
               // out.println(clg);
                String hsc1=request.getParameter("s_hsc");
                int s_hsc=Integer.parseInt(hsc1);
               // out.println(hsc);
                String s_hsc_passyear=request.getParameter("s_hsc_passyear");
                //int s_hsc_passyear=Integer.parseInt(passing_yr);
               // out.println(pass_yr);

             String s_ug_college=request.getParameter("s_ug_college");
            // out.println(cname);
             String s_ug_dept=request.getParameter("s_ug_dept");
            // out.println(dept);
             String fe1=request.getParameter("s_ug_fe");
              int s_ug_fe=Integer.parseInt(fe1);
              //out.println(fe);
               String se1=request.getParameter("s_ug_se");
              int s_ug_se=Integer.parseInt(se1);
              //out.println(se);
               String te1=request.getParameter("s_ug_te");
              int s_ug_te=Integer.parseInt(te1);
              //out.println(te);
               String be1=request.getParameter("s_ug_be");
              int s_ug_be=Integer.parseInt(be1);
              //out.println(be);
              String s_ug_passyear=request.getParameter("s_ug_passyear");
              //int s_ug_passyear=Integer.parseInt(year1);
              //out.println(year);
             
               Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
PreparedStatement prmst=con.prepareStatement("insert into s_education values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
prmst.setInt(1, s_roll);
prmst.setString(2, s_school);
prmst.setInt(3, s_ssc);
prmst.setString(4, s_ssc_passyear);

prmst.setString(5, s_hsc_college);
prmst.setInt(6, s_hsc);
prmst.setString(7, s_hsc_passyear);

prmst.setString(8, s_ug_college);
prmst.setString(9, s_ug_dept);
prmst.setInt(10, s_ug_fe);
prmst.setInt(11, s_ug_se);
prmst.setInt(12, s_ug_te);
prmst.setInt(13, s_ug_be);
prmst.setString(14, s_ug_passyear);



int r=prmst.executeUpdate();
if (r>0)
{ 
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ADDED SUCCESSFULLY !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("StudUserpass.html");
                     rd.include(request, response);
}
else
{
out.println("<script type=\"text/javascript\">");
                    out.println("alert('DATA NOT ADDED !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("Stud_edu.html");
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
            Logger.getLogger(stud_education.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(stud_education.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(stud_education.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(stud_education.class.getName()).log(Level.SEVERE, null, ex);
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
