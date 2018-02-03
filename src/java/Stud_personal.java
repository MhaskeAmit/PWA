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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author USER
 */
@MultipartConfig(maxFileSize = 16177215)
public class Stud_personal extends HttpServlet {

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
            //out.println(roll);
            String s_fname=request.getParameter("s_fname");
            //out.println(fname);
             String s_lname=request.getParameter("s_lname");
              //out.println(lname);
              String s_add=request.getParameter("s_add");
             // out.println(add);
              String s_padd=request.getParameter("s_prmnt_add");
              //out.println(padd);
              String s_mobile=request.getParameter("s_mobile");
              //out.println(mobile);
             String s_email=request.getParameter("s_email");
            // out.println(email);
             String s_bdate=request.getParameter("s_bdate");
             //out.println(birthdate);
            
             String s_gen=request.getParameter("s_gen");
            // out.println(gen);
             
           InputStream inputstream=null;
         Part filePart=request.getPart("s_pic");
        
         inputstream =filePart.getInputStream();
      // System.out.println(inputstream);
             
            
              Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
PreparedStatement prmst=con.prepareStatement("insert into s_personal values(?,?,?,?,?,?,?,?,?,?)");
prmst.setInt(1, s_roll);
prmst.setString(2, s_fname);
prmst.setString(3, s_lname);
prmst.setString(4, s_add);
prmst.setString(5, s_padd);
prmst.setString(6, s_mobile);
prmst.setString(7, s_email);
prmst.setString(8, s_bdate);
prmst.setString(9, s_gen);
prmst.setBlob(10, inputstream);


int r=prmst.executeUpdate();
if (r>0)
{ 
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ADDED SUCCESSFULLY !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("Student_edu.html");
                     rd.include(request, response);
}
else
{
out.println("<script type=\"text/javascript\">");
                    out.println("alert('DATA NOT ADDED !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("Teacher_personal.html");
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
            Logger.getLogger(Stud_personal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Stud_personal.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Stud_personal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Stud_personal.class.getName()).log(Level.SEVERE, null, ex);
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
