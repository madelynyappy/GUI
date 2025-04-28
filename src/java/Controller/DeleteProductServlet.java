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
import model.DBConnector;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productID = request.getParameter("productID");
        
        try {
            Connection conn = DBConnector.getConnection();
            
            // First, delete from ProductImage table (if image exists)
            PreparedStatement psImage = conn.prepareStatement(
                "DELETE FROM ProductImage WHERE ProductID = ?"
            );
            psImage.setString(1, productID);
            psImage.executeUpdate();
            
            // Then delete from Product table
            PreparedStatement psProduct = conn.prepareStatement(
                "DELETE FROM Product WHERE ProductID = ?"
            );
            psProduct.setString(1, productID);
            psProduct.executeUpdate();
            
            conn.close();
            
            response.sendRedirect(request.getContextPath() + "/html/STAFF/product/productListTest.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}

