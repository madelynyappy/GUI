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
        String[] selectedProducts = request.getParameterValues("selectedProducts");

        try (Connection conn = DBConnector.getConnection()) {
            String updateSQL = "UPDATE Product SET discount = ? WHERE productID = ?";
            PreparedStatement ps = conn.prepareStatement(updateSQL);

            if (selectedProducts != null) {
                for (String productID : selectedProducts) {
                    String discountStr = request.getParameter("discount_" + productID);
                    int discount = Integer.parseInt(discountStr);
                    ps.setInt(1, discount);
                    ps.setString(2, productID);
                    ps.executeUpdate();
                }
            }

            response.sendRedirect(request.getContextPath() + "/html/STAFF/product/promotionList.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}

