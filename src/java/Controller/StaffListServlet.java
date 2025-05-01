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
import model.Staff;
import model.DBConnector;

@WebServlet("/StaffListServlet")
public class StaffListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Staff> staffList = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "SELECT * FROM STAFF";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Staff s = new Staff();
                s.setStaffID(rs.getString("STAFFID"));
                s.setStaffName(rs.getString("STAFFNAME"));
                s.setContactNumber(rs.getString("STAFFCONTACTNUMBER"));
                s.setEmail(rs.getString("STAFFEMAIL"));
                s.setAddress(rs.getString("STAFFADDRESS"));
                s.setUsername(rs.getString("STAFFUSERNAME"));
                s.setPassword(rs.getString("STAFFPASSWORD"));
                s.setRoleTitle(rs.getString("STAFFROLETITLE"));
                s.setStatus(rs.getString("STAFFSTATUS"));
                staffList.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("staffList", staffList);
        RequestDispatcher rd = request.getRequestDispatcher("/html/STAFF/staff/staffList.jsp");
        rd.forward(request, response);
    }
}
