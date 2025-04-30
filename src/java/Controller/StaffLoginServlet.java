/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author Madelyn Yap
 */


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.DBConnector;
    
    @WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("staffUserName");
        String password = request.getParameter("staffPassword");

        try {
            Connection conn = DBConnector.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM Staff WHERE staffUserName = ? AND staffPassword = ? AND staffStatus = 'active'"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("staffID", rs.getString("staffID"));
                session.setAttribute("staffName", rs.getString("staffName"));
                session.setAttribute("staffRoleTitle", rs.getString("staffRoleTitle"));

                conn.close();
                response.sendRedirect(request.getContextPath() + "/html/STAFF/home/dashboard.jsp");

            } else {
                // Login failed
                conn.close();
                response.sendRedirect(request.getContextPath() + "/html/STAFF/signInSignUp/signIn.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}




