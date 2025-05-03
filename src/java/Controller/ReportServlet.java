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

@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        
        // Handle dateRange requests
        if ("dateRange".equals(type)) {
            handleDateRangeRequest(request, response);
        }else{
            getReportData(request, response);
        }

    }

        private void handleDateRangeRequest(HttpServletRequest request, HttpServletResponse response) {
        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT MIN(orderDate) AS minDate FROM Orders";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            String result = "";
            if (rs.next()) {
                result = rs.getString("minDate");
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"data\": \"" + result + "\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }


    private void getReportData(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String type = request.getParameter("type");
        List<Map<String, Object>> reportData = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "";
            PreparedStatement ps = null;

            switch (type) {
                case "top10":
                    sql = "SELECT p.productName, SUM(i.quantity) AS totalSold, SUM(i.price * i.quantity) AS totalRevenue " +
                          "FROM OrderItem i " +
                          "JOIN Product p ON i.productID = p.productID " +
                          "GROUP BY p.productID, p.productName " +
                          "ORDER BY totalSold DESC FETCH FIRST 10 ROWS ONLY";
                    ps = conn.prepareStatement(sql);
                    break;

                case "daily":
                    String date = request.getParameter("date");
                    if (date == null || date.isEmpty()) {
                        request.setAttribute("reportType", type);
                        request.setAttribute("reportData", null);
                        request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
                        return;
                    }
                    
                    sql = "SELECT o.orderDate, COUNT(DISTINCT o.orderID) AS totalOrders, " +
                          "SUM(i.quantity) AS totalItems, SUM(i.price * i.quantity) AS dailyTotal " +
                          "FROM Orders o " +
                          "JOIN OrderItem i ON o.orderID = i.orderID " +
                          "WHERE DATE(o.orderDate) = ? " +
                          "GROUP BY o.orderDate";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, date);
                    break;

                case "monthly":
                    String monthInput = request.getParameter("monthInput");
                    if (monthInput == null || monthInput.isEmpty()) {
                        request.setAttribute("reportType", type);
                        request.setAttribute("reportData", null);
                        request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
                        return;
                    }
                    
                    sql = "SELECT CAST(o.orderDate AS DATE) AS date, " +
                          "COUNT(DISTINCT o.orderID) AS totalOrders, " +
                          "SUM(i.quantity) AS totalItems, " +
                          "SUM(i.price * i.quantity) AS dailyTotal " +
                          "FROM Orders o " +
                          "JOIN OrderItem i ON o.orderID = i.orderID " +
                          "WHERE YEAR(o.orderDate) = ? AND MONTH(o.orderDate) = ? " +
                          "GROUP BY CAST(o.orderDate AS DATE) " +
                          "ORDER BY date DESC";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, monthInput.substring(0, 4)); // Year
                    ps.setString(2, monthInput.substring(5, 7)); // Month
                    break;

                case "yearly":
                    String year = request.getParameter("year");
                    if (year == null || year.isEmpty()) {
                        request.setAttribute("reportType", type);
                        request.setAttribute("reportData", null);
                        request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
                        return;
                    }
                    
                    sql = "SELECT MONTH(o.orderDate) AS monthNum, " +
                          "COUNT(DISTINCT o.orderID) AS totalOrders, " +
                          "SUM(i.quantity) AS totalItems, " +
                          "SUM(i.price * i.quantity) AS monthlyTotal " +
                          "FROM Orders o " +
                          "JOIN OrderItem i ON o.orderID = i.orderID " +
                          "WHERE YEAR(o.orderDate) = ? " +
                          "GROUP BY MONTH(o.orderDate) " +
                          "ORDER BY monthNum DESC";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, year);
                    break;

                default:
                    request.setAttribute("reportType", type);
                    request.setAttribute("reportData", null);
                    request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
                    return;
            }

            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columns = rsmd.getColumnCount();

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columns; i++) {
                    row.put(rsmd.getColumnLabel(i), rs.getObject(i));
                }
                reportData.add(row);
            }

            // Always set reportType and reportData, even if empty
            request.setAttribute("reportType", type);
            request.setAttribute("reportData", reportData.isEmpty() ? null : reportData);
            request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("reportType", type);
            request.setAttribute("reportData", null);
            request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
        }       
    }
    
}