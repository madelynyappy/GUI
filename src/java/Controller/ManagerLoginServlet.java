/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author Madelyn Yap
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.DBConnector;

@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("managerUserName");
        String password = request.getParameter("managerPassword");

        try {
            Connection conn = DBConnector.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM MANAGER WHERE MANAGERUSERNAME = ? AND MANAGERPASSWORD = ?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("managerID", rs.getString("MANAGERID"));
                session.setAttribute("managerName", rs.getString("MANAGERNAME"));

                conn.close();
                response.sendRedirect(request.getContextPath() + "/html/STAFF/home/managerDashboard.jsp"); // adjust if needed
            } else {
                // Failed login
                conn.close();
                response.sendRedirect(request.getContextPath() + "/html/STAFF/signInSignUp/managerLogin.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}

