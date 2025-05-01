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
import java.util.ArrayList;
import model.Customer;
import model.DBConnector;

@WebServlet("/CustomerListServlet")
public class CustomerListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Customer> customers = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT * FROM CUSTOMER";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerID(rs.getString("CUSTOMERID"));
                c.setCustomerName(rs.getString("CUSTOMERNAME"));
                c.setContactNumber(rs.getString("CUSTOMERCONTACTNUMBER"));
                c.setEmail(rs.getString("CUSTOMEREMAIL"));
                c.setBillingAddress(rs.getString("CUSTOMERBILLINGADDRESS"));
                c.setShippingAddress(rs.getString("CUSTOMERSHIPPINGADDRESS"));
                c.setUsername(rs.getString("CUSTOMERUSERNAME"));
                c.setPassword(rs.getString("CUSTOMERPASSWORD"));
                customers.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("customerList", customers);
        RequestDispatcher rd = request.getRequestDispatcher("/STAFF/customer/customerList.jsp");
        rd.forward(request, response);
    }
}

