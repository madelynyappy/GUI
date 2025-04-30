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

@WebServlet("/OrderStatusServlet")
public class OrderStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Map<String, Object>> orders = new LinkedHashMap<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT o.orderID, o.orderDate, o.paymentMethod, o.totalAmount, o.discount, o.status, " +
                         "i.productID, i.quantity, i.price " +
                         "FROM Orders o JOIN OrderItem i ON o.orderID = i.orderID " +
                         "ORDER BY o.orderDate DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderID = rs.getString("orderID");

                Map<String, Object> orderData = orders.getOrDefault(orderID, new HashMap<>());

                orderData.put("orderDate", rs.getTimestamp("orderDate"));
                orderData.put("paymentMethod", rs.getString("paymentMethod"));
                orderData.put("totalAmount", rs.getDouble("totalAmount"));
                orderData.put("discount", rs.getDouble("discount"));
                orderData.put("orderStatus", rs.getString("status")); // match JSP field

                List<Map<String, Object>> items = (List<Map<String, Object>>) orderData.getOrDefault("items", new ArrayList<>());

                Map<String, Object> item = new HashMap<>();
                item.put("productID", rs.getString("productID"));
                item.put("quantity", rs.getInt("quantity"));
                item.put("price", rs.getDouble("price"));
                items.add(item);

                orderData.put("items", items);
                orders.put(orderID, orderData);
            }

            request.setAttribute("orders", orders);
            RequestDispatcher rd = request.getRequestDispatcher("/html/STAFF/product/orderStatus.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderID = request.getParameter("orderID");
        String status = request.getParameter("orderStatus");

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "UPDATE Orders SET status = ? WHERE orderID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, orderID);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/OrderStatusServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
            
        }
    }
}
