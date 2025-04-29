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
import java.util.List;
import model.CartItem;
import model.DBConnector;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("customerID") == null) {
            response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/html/USER/product/cart.jsp");
            return;
        }

        try {
            // Get values from form
            String customerID = (String) session.getAttribute("customerID");
            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String paymentMethod = request.getParameter("paymentMethod");

            // These values come from hidden input fields in checkout.jsp
            double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            // Generate Order ID
            String orderID = "O" + System.currentTimeMillis() % 100000;

            Connection conn = DBConnector.getConnection();

            // Save order
            String insertOrder = "INSERT INTO Orders (orderID, customerID, totalAmount, paymentMethod, shippingAddress, orderDate, discount) " +
                                 "VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?)";

            PreparedStatement psOrder = conn.prepareStatement(insertOrder);
            psOrder.setString(1, orderID);
            psOrder.setString(2, customerID);
            psOrder.setDouble(3, totalAmount);
            psOrder.setString(4, paymentMethod);
            psOrder.setString(5, address);
            psOrder.setDouble(6, discountAmount);

            psOrder.executeUpdate();

            // Save order items
            for (CartItem item : cart) {
                String insertItem = "INSERT INTO OrderItem (orderID, productID, quantity, price) VALUES (?, ?, ?, ?)";
                PreparedStatement psItem = conn.prepareStatement(insertItem);
                psItem.setString(1, orderID);
                psItem.setString(2, item.getProduct().getProductID());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getProduct().getProductPrice());
                psItem.executeUpdate();
            }

            conn.close();

            // Clear cart after order placed
            session.removeAttribute("cart");

            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/html/USER/product/checkoutSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
