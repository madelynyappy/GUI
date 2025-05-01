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
import model.DBConnector;

@WebServlet("/DeleteStaffServlet")
public class DeleteStaffServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffID = request.getParameter("staffID");

        try (Connection conn = DBConnector.getConnection()) {
            String sql = "DELETE FROM STAFF WHERE STAFFID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staffID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/StaffListServlet");
    }
}

