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

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            String customerName = request.getParameter("customerName");
            String contactNumber = request.getParameter("customerContactNumber");
            String email = request.getParameter("customerEmail");
            String billingAddress = request.getParameter("customerBillingAddress");
            String shippingAddress = request.getParameter("customerShippingAddress");
            String username = request.getParameter("customerUserName");
            String password = request.getParameter("customerPassword");

            String customerID = "CU" + System.currentTimeMillis() % 100000;

            Connection conn = DBConnector.getConnection();

            // Check for existing customerName, customerUserName, or customerEmail
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT customerName, customerUserName, customerEmail FROM Customer WHERE customerName = ? OR customerUserName = ? OR customerEmail = ?"
            );
            checkStmt.setString(1, customerName);
            checkStmt.setString(2, username);
            checkStmt.setString(3, email);

            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String existingName = rs.getString("customerName");
                String existingUsername = rs.getString("customerUserName");
                String existingEmail = rs.getString("customerEmail");

                if (customerName.equals(existingName)) {
                    request.setAttribute("errorMessage", "Customer name already registered. Please use a different name.");
                } else if (username.equals(existingUsername)) {
                    request.setAttribute("errorMessage", "Username already taken. Please choose another username.");
                } else if (email.equals(existingEmail)) {
                    request.setAttribute("errorMessage", "Email already registered. Please use a different Gmail.");
                }

                RequestDispatcher dispatcher = request.getRequestDispatcher("/html/USER/signInSignUp/signUp.jsp");
                dispatcher.forward(request, response);

                rs.close();
                checkStmt.close();
                conn.close();
                return;
            }
            rs.close();
            checkStmt.close();

            // Insert new customer
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO Customer (customerID, customerName, customerContactNumber, customerEmail, customerBillingAddress, customerShippingAddress, customerUserName, customerPassword) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, customerID);
            ps.setString(2, customerName);
            ps.setString(3, contactNumber);
            ps.setString(4, email);
            ps.setString(5, billingAddress);
            ps.setString(6, shippingAddress);
            ps.setString(7, username);
            ps.setString(8, password);

            ps.executeUpdate();
            conn.close();

            response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
