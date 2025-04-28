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

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productID = request.getParameter("productID");
        
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        if (cart != null) {
            cart.removeIf(item -> item.getProduct().getProductID().equals(productID));
            session.setAttribute("cart", cart);
        }
        
        response.sendRedirect(request.getContextPath() + "/html/USER/product/cart.jsp");
    }
}

