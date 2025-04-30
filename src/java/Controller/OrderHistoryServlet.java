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
import java.util.*;
import model.DBConnector;

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerID") == null) {
            response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
            return;
        }

        String customerID = (String) session.getAttribute("customerID");
        Map<String, Map<String, Object>> groupedOrders = new LinkedHashMap<>();
        String customerName = "";

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT o.orderID, o.orderDate, o.totalAmount, o.paymentMethod, o.discount, o.status, " +
                         "i.productID, i.quantity, i.price, c.customerName " +
                         "FROM Orders o " +
                         "JOIN OrderItem i ON o.orderID = i.orderID " +
                         "JOIN Customer c ON o.customerID = c.customerID " +
                         "WHERE o.customerID = ? " +
                         "ORDER BY o.orderDate DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderID = rs.getString("orderID");

                // Fetch customer name only once
                if (customerName.isEmpty()) {
                    customerName = rs.getString("customerName");
                }

                Map<String, Object> order;
                List<Map<String, Object>> items;

                if (!groupedOrders.containsKey(orderID)) {
                    order = new HashMap<>();
                    items = new ArrayList<>();
                    order.put("orderDate", rs.getTimestamp("orderDate"));
                    order.put("totalAmount", rs.getDouble("totalAmount"));
                    order.put("paymentMethod", rs.getString("paymentMethod"));
                    order.put("discount", rs.getDouble("discount"));
                    order.put("orderStatus", rs.getString("status")); // ✅ INCLUDE STATUS
                    order.put("items", items);
                    groupedOrders.put(orderID, order);
                } else {
                    order = groupedOrders.get(orderID);
                    items = (List<Map<String, Object>>) order.get("items");
                }

                Map<String, Object> item = new HashMap<>();
                item.put("productID", rs.getString("productID"));
                item.put("quantity", rs.getInt("quantity"));
                item.put("price", rs.getDouble("price"));
                items.add(item);
            }

            request.setAttribute("customerName", customerName);
            request.setAttribute("orders", groupedOrders);
            RequestDispatcher rd = request.getRequestDispatcher("/html/USER/product/orderHistory.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
