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
public class teacherRegi extends HttpServlet {

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
        try (PrintWriter out = response.getWriter())
        {
            String id1=request.getParameter("t_id");
             int t_id=Integer.parseInt(id1);
            //out.println(id1);
            String t_fname=request.getParameter("t_fname");
            //out.println(fname);
             String t_lname=request.getParameter("t_lname");
              //out.println(lname);
              String t_address=request.getParameter("t_address");
              //out.println(add);
              String t_permanet_address=request.getParameter("t_permanet_address");
              //out.println(padd);
              String t_mobile=request.getParameter("t_mobile");
             // out.println(mobile);
             String t_email=request.getParameter("t_email");
            // out.println(email);
             String t_birthdate=request.getParameter("t_birthdate");
             //out.println(birthdate);
            
             String t_gender=request.getParameter("t_gender");
             //out.println(gen);
             
           InputStream inputstream=null;
           
         Part filePart=request.getPart("t_pic");
         
            inputstream = filePart.getInputStream();
        
            
         inputstream =filePart.getInputStream();
      // System.out.println("Inputstream==="+inputstream);
             
            
              Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edulite","root","root123");
PreparedStatement prmst=con.prepareStatement("insert into t_registration values(?,?,?,?,?,?,?,?,?,?)");
prmst.setInt(1, t_id);
prmst.setString(2, t_fname);
prmst.setString(3, t_lname);
prmst.setString(4, t_address);
prmst.setString(5, t_permanet_address);
prmst.setString(6, t_mobile);
prmst.setString(7, t_email);
prmst.setString(8, t_birthdate);
prmst.setString(9, t_gender);
prmst.setBlob(10, inputstream);


int r=prmst.executeUpdate();
if (r>0)
{ 
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ADDED SUCCESSFULLY !');");
                    out.println("</script>");
                     RequestDispatcher rd;
                     rd =request.getRequestDispatcher("Teacher_edu.html");
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

 
         
          
          
    }}

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
            Logger.getLogger(teacherRegi.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(teacherRegi.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(teacherRegi.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(teacherRegi.class.getName()).log(Level.SEVERE, null, ex);
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

