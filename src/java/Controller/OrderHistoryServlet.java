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
        List<Map<String, Object>> orders = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT o.orderID, o.orderDate, o.totalAmount, o.paymentMethod, o.discount, i.productID, i.quantity, i.price " +
                         "FROM Orders o " +
                         "JOIN OrderItem i ON o.orderID = i.orderID " +
                         "WHERE o.customerID = ? " +
                         "ORDER BY o.orderDate DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("orderID", rs.getString("orderID"));
                row.put("orderDate", rs.getTimestamp("orderDate"));
                row.put("totalAmount", rs.getDouble("totalAmount"));
                row.put("paymentMethod", rs.getString("paymentMethod"));
                row.put("discount", rs.getDouble("discount"));
                row.put("productID", rs.getString("productID"));
                row.put("quantity", rs.getInt("quantity"));
                row.put("price", rs.getDouble("price"));
                orders.add(row);
            }

            request.setAttribute("orderList", orders);
            RequestDispatcher rd = request.getRequestDispatcher("/html/USER/order/orderHistory.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}

