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
import java.util.List;
import model.CartItem;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/html/USER/product/cart.jsp");
            return;
        }

        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        // In real system, here you would insert order into database
        System.out.println("Order placed:");
        System.out.println("Name: " + fullName);
        System.out.println("Phone: " + phoneNumber);
        System.out.println("Address: " + address);
        System.out.println("Payment Method: " + paymentMethod);

        // Order items
        for (CartItem item : cart) {
            System.out.println("Product: " + item.getProduct().getProductName() + " x " + item.getQuantity());
        }

        // After order placed, clear cart
        session.removeAttribute("cart");

        // Redirect to success page
        response.sendRedirect(request.getContextPath() + "/html/USER/product/checkoutSuccess.jsp");
    }
}

