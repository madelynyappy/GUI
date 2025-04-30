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
            // DERBY REQUIRES SCHEMA PREFIX: APP.ORDERS and APP.ORDERITEM
            String sql = "SELECT o.ORDERID, o.ORDERDATE, o.PAYMENTMETHOD, o.TOTALAMOUNT, o.DISCOUNT, o.STATUS, " +
                         "i.PRODUCTID, i.QUANTITY, i.PRICE " +
                         "FROM APP.ORDERS o JOIN APP.ORDERITEM i ON o.ORDERID = i.ORDERID " +
                         "ORDER BY o.ORDERDATE DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String orderID = rs.getString("ORDERID");

                Map<String, Object> orderData = orders.getOrDefault(orderID, new HashMap<>());

                orderData.put("orderDate", rs.getTimestamp("ORDERDATE"));
                orderData.put("paymentMethod", rs.getString("PAYMENTMETHOD"));
                orderData.put("totalAmount", rs.getDouble("TOTALAMOUNT"));
                orderData.put("discount", rs.getDouble("DISCOUNT"));
                orderData.put("orderStatus", rs.getString("STATUS")); // match JSP key

                List<Map<String, Object>> items = (List<Map<String, Object>>) orderData.getOrDefault("items", new ArrayList<>());

                Map<String, Object> item = new HashMap<>();
                item.put("productID", rs.getString("PRODUCTID"));
                item.put("quantity", rs.getInt("QUANTITY"));
                item.put("price", rs.getDouble("PRICE"));
                items.add(item);

                orderData.put("items", items);
                orders.put(orderID, orderData);
            }

            // Debug: log how many orders were found
            System.out.println("Orders fetched: " + orders.size());

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
            String sql = "UPDATE APP.ORDERS SET STATUS = ? WHERE ORDERID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, orderID);
            ps.executeUpdate();

            System.out.println("Updated order " + orderID + " to status: " + status);

            response.sendRedirect(request.getContextPath() + "/OrderStatusServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
