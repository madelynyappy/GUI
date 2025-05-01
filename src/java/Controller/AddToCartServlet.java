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
import model.*;
import java.sql.Connection;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productID = request.getParameter("productID");

        try {
            Connection conn = DBConnector.getConnection();
            ProductDAO productDAO = new ProductDAO(conn);
            Product product = productDAO.getProductByID(productID);
            conn.close();

            // Apply discount before storing in cart
            double originalPrice = product.getProductPrice();
            int discount = product.getDiscount();

            if (discount > 0) {
                double finalPrice = originalPrice - (originalPrice * discount / 100);
                product.setProductPrice(finalPrice); // overwrite with discounted price
            }

            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean found = false;
            for (CartItem item : cart) {
                if (item.getProduct().getProductID().equals(productID)) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new CartItem(product, 1));
            }

            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/html/USER/product/cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
