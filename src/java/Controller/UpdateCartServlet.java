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
import java.util.*;
import model.CartItem;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                String paramName = "quantity_" + item.getProduct().getProductID();
                String quantityStr = request.getParameter(paramName);

                if (quantityStr != null) {
                    try {
                        int quantity = Integer.parseInt(quantityStr);
                        if (quantity > 0) {
                            item.setQuantity(quantity);
                        } else {
                            item.setQuantity(1); // fallback minimum
                        }
                    } catch (NumberFormatException e) {
                        // Ignore invalid input
                    }
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/html/USER/product/cart.jsp");
    }
}

