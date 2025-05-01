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

    @WebServlet("/StaffRegisterServlet")
public class StaffRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            String staffName = request.getParameter("staffName");
            String contactNumber = request.getParameter("staffContactNumber");
            String email = request.getParameter("staffEmail");
            String address = request.getParameter("staffAddress");
            String username = request.getParameter("staffUserName");
            String password = request.getParameter("staffPassword");
            String roleTitle = request.getParameter("staffRoleTitle");

            String staffID = "ST" + System.currentTimeMillis() % 100000;

            Connection conn = DBConnector.getConnection();

            // Check for existing staffName, username, or email
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT staffUserName, staffEmail FROM Staff WHERE staffUserName = ? OR staffEmail = ?"
            );
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);

            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Registration failed due to duplicate username or email
                if (username.equals(rs.getString("staffUserName"))) {
                    request.setAttribute("errorMessage", "Username already taken. Please choose another.");
                } else if (email.equals(rs.getString("staffEmail"))) {
                    request.setAttribute("errorMessage", "Email already registered. Please use a different email.");
                }

                RequestDispatcher dispatcher = request.getRequestDispatcher("/html/STAFF/signInSignUp/signUp.jsp");
                dispatcher.forward(request, response);

                return;
            }

            // Insert new staff
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO Staff (staffID, staffName, staffContactNumber, staffEmail, staffAddress, staffUserName, staffPassword, staffRoleTitle, staffStatus) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'active')"
            );
            ps.setString(1, staffID);
            ps.setString(2, staffName);
            ps.setString(3, contactNumber);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, username);
            ps.setString(7, password);
            ps.setString(8, roleTitle);

            ps.executeUpdate();
            conn.close();

            response.sendRedirect(request.getContextPath() + "/html/STAFF/signInSignUp/login.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}



 
