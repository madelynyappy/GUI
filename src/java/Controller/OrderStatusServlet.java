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
        List<Map<String, Object>> orders = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT o.orderID, o.orderDate, o.paymentMethod, o.totalAmount, o.discount, o.status, " +
                         "i.productID, i.quantity, i.price " +
                         "FROM Orders o JOIN OrderItem i ON o.orderID = i.orderID " +
                         "ORDER BY o.orderDate DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("orderID", rs.getString("orderID"));
                row.put("orderDate", rs.getTimestamp("orderDate"));
                row.put("paymentMethod", rs.getString("paymentMethod"));
                row.put("totalAmount", rs.getDouble("totalAmount"));
                row.put("discount", rs.getDouble("discount"));
                row.put("status", rs.getString("status"));
                row.put("productID", rs.getString("productID"));
                row.put("quantity", rs.getInt("quantity"));
                row.put("price", rs.getDouble("price"));
                orders.add(row);
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
        String status = request.getParameter("status");

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
