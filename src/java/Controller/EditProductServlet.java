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
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Product;
import model.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import java.sql.Connection;
import model.*;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String productID = request.getParameter("productID");
            System.out.println("EditProductServlet called with productID: " + productID); // Debug print

            Connection conn = DBConnector.getConnection();
            ProductDAO productDAO = new ProductDAO(conn);

            // Get product by ID
            Product product = productDAO.getProductByID(productID);

            conn.close();
            
            if (product != null) {
                request.setAttribute("product", product);
                RequestDispatcher rd = request.getRequestDispatcher("/html/STAFF/product/productmodify.jsp");
                rd.forward(request, response);
            } else {
                // If product not found
                response.sendRedirect(request.getContextPath() + "/html/ERROR/404error.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}

