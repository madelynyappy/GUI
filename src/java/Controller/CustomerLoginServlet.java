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

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("customerUserName");
        String password = request.getParameter("customerPassword");

        try {
            Connection conn = DBConnector.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM Customer WHERE customerUserName = ? AND customerPassword = ?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("customerID", rs.getString("customerID"));
                session.setAttribute("customerName", rs.getString("customerName"));
                session.setAttribute("customerEmail", rs.getString("customerEmail"));
                session.setAttribute("customerContactNumber", rs.getString("customerContactNumber"));
                session.setAttribute("customerBillingAddress", rs.getString("customerBillingAddress"));
                session.setAttribute("customerShippingAddress", rs.getString("customerShippingAddress"));
                
                conn.close();
               response.sendRedirect(request.getContextPath() + "/html/USER/home/welcome.jsp");

            } else {
                // Login failed
                conn.close();
                response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
