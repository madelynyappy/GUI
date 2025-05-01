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
        
        try (Connection conn = DBConnector.getConnection()) {
            if ("updateDiscount".equals(action)) {
                // Update promotion value
                String discountStr = request.getParameter("discount");
                int discount = Integer.parseInt(discountStr);
                
                // Check if record exists
                String checkSQL = "SELECT COUNT(*) FROM productDiscount WHERE productID = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSQL);
                checkPs.setString(1, productID);
                ResultSet rs = checkPs.executeQuery();
                rs.next();
                boolean exists = rs.getInt(1) > 0;
                
                String updateSQL;
                if (exists) {
                    updateSQL = "UPDATE productDiscount SET discount = ? WHERE productID = ?";
                } else {
                    updateSQL = "INSERT INTO productDiscount (productID, discount) VALUES (?, ?)";
                }
                
                PreparedStatement ps = conn.prepareStatement(updateSQL);
                ps.setInt(1, discount);
                ps.setString(2, productID);
                ps.executeUpdate();
                
            } else if ("togglePromotion".equals(action)) {
                // Toggle promotion enabled status
                String enabledStr = request.getParameter("enabled");
                boolean enabled = "true".equals(enabledStr);
                
                // Check if record exists
                String checkSQL = "SELECT COUNT(*) FROM productDiscount WHERE productID = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSQL);
                checkPs.setString(1, productID);
                ResultSet rs = checkPs.executeQuery();
                rs.next();
                boolean exists = rs.getInt(1) > 0;
                
                String updateSQL;
                if (exists) {
                    updateSQL = "UPDATE productDiscount SET promotionEnabled = ? WHERE productID = ?";
                } else {
                    updateSQL = "INSERT INTO productDiscount (productID, promotionEnabled) VALUES (?, ?)";
                }
                
                PreparedStatement ps = conn.prepareStatement(updateSQL);
                ps.setBoolean(1, enabled);
                ps.setString(2, productID);
                ps.executeUpdate();
            }
            
            response.sendRedirect(request.getContextPath() + "/html/STAFF/product/promotionList.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}