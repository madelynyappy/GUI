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
import java.sql.*;
import model.DBConnector;

@WebServlet("/UpdatePromotionServlet")
public class UpdatePromotionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String productID = request.getParameter("productID");
        
        System.out.println("Received action: " + action);
        System.out.println("Product ID: " + productID);
        
        try (Connection conn = DBConnector.getConnection()) {
            if ("updateDiscount".equals(action)) {
                // Update promotion value
                String discountStr = request.getParameter("discount");
                int discount = Integer.parseInt(discountStr);
                
                System.out.println("Updating discount to: " + discount);
                
                // Check if record exists
                String checkSQL = "SELECT COUNT(*) FROM productDiscount WHERE productID = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSQL);
                checkPs.setString(1, productID);
                ResultSet rs = checkPs.executeQuery();
                rs.next();
                boolean exists = rs.getInt(1) > 0;
                
                System.out.println("Record exists: " + exists);
                
                String updateSQL;
                if (exists) {
                    updateSQL = "UPDATE productDiscount SET discount = ? WHERE productID = ?";
                    System.out.println("Executing UPDATE");
                } else {
                    updateSQL = "INSERT INTO productDiscount (productID, discount) VALUES (?, ?)";
                    System.out.println("Executing INSERT");
                }
                
                PreparedStatement ps = conn.prepareStatement(updateSQL);
                ps.setInt(1, discount);
                ps.setString(2, productID);
                int rowsAffected = ps.executeUpdate();
                System.out.println("Rows affected: " + rowsAffected);
                
            } else if ("togglePromotion".equals(action)) {
                // Toggle promotion enabled status
                String enabledStr = request.getParameter("enabled");
                boolean enabled = "true".equals(enabledStr);
                
                System.out.println("Updating promotion enabled to: " + enabled);
                
                // Check if record exists
                String checkSQL = "SELECT COUNT(*) FROM productDiscount WHERE productID = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSQL);
                checkPs.setString(1, productID);
                ResultSet rs = checkPs.executeQuery();
                rs.next();
                boolean exists = rs.getInt(1) > 0;
                
                System.out.println("Record exists: " + exists);
                
                String updateSQL;
                if (exists) {
                    updateSQL = "UPDATE productDiscount SET promotionEnabled = ? WHERE productID = ?";
                    System.out.println("Executing UPDATE");
                } else {
                    updateSQL = "INSERT INTO productDiscount (productID, promotionEnabled) VALUES (?, ?)";
                    System.out.println("Executing INSERT");
                }
                
                PreparedStatement ps = conn.prepareStatement(updateSQL);
                ps.setBoolean(1, enabled);
                ps.setString(2, productID);
                int rowsAffected = ps.executeUpdate();
                System.out.println("Rows affected: " + rowsAffected);
            }
            
            // Send success response
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Success");
            
        } catch (Exception e) {
            System.err.println("Error in UpdatePromotionServlet: ");
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}