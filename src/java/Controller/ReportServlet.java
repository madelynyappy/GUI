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

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        String selectedMonth = request.getParameter("month");
        String selectedYear = request.getParameter("year");

        List<Map<String, Object>> reportData = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "";
            PreparedStatement ps = null;

            switch (type) {
                case "top10":
                    sql = "SELECT productID, SUM(quantity) AS totalSold FROM OrderItem " +
                          "GROUP BY productID ORDER BY totalSold DESC FETCH FIRST 10 ROWS ONLY";
                    ps = conn.prepareStatement(sql);
                    break;

                case "daily":
                    sql = "SELECT o.orderDate, SUM(i.price * i.quantity) AS dailyTotal FROM Orders o " +
                          "JOIN OrderItem i ON o.orderID = i.orderID " +
                          "GROUP BY o.orderDate ORDER BY o.orderDate DESC";
                    ps = conn.prepareStatement(sql);
                    break;

                case "monthly":
                if (selectedMonth == null || selectedMonth.isEmpty() || selectedYear == null || selectedYear.isEmpty()) {
                    request.setAttribute("reportType", type);
                    request.setAttribute("reportData", null);
                    request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
                    return;
                }

                sql = "SELECT MONTHNAME(o.orderDate) AS `Month Name`, " +
                      "MONTH(o.orderDate) AS `Month`, " +
                      "YEAR(o.orderDate) AS `Year`, " +
                      "SUM(i.price * i.quantity) AS `Monthly Total` " +
                      "FROM Orders o " +
                      "JOIN OrderItem i ON o.orderID = i.orderID " +
                      "WHERE MONTH(o.orderDate) = ? AND YEAR(o.orderDate) = ? " +
                      "GROUP BY `Month Name`, `Month`, `Year` " +
                      "ORDER BY `Year` DESC, `Month` DESC";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(selectedMonth));
                ps.setInt(2, Integer.parseInt(selectedYear));
                break;



                case "yearly":
                    if (selectedYear == null || selectedYear.isEmpty()) {
                        request.setAttribute("reportType", type);
                        request.setAttribute("reportData", null);
                        request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
                        return;
                    }
                    sql = "SELECT SUBSTR(o.orderDate, 1, 4) AS \"year\", SUM(i.price * i.quantity) AS yearlyTotal " +
                          "FROM Orders o JOIN OrderItem i ON o.orderID = i.orderID " +
                          "WHERE SUBSTR(o.orderDate, 1, 4) = ? " +
                          "GROUP BY SUBSTR(o.orderDate, 1, 4) ORDER BY \"year\" DESC";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, selectedYear);
                    break;

                default:
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

            request.setAttribute("reportType", type);
            request.setAttribute("reportData", reportData);
            request.getRequestDispatcher("/html/STAFF/report/report.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}
