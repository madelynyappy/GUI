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

@WebServlet("/CustomerLogoutServlet")
public class CustomerLogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false = do not create new session
        if (session != null) {
            session.invalidate(); // clear session
        }

        // After logout, send back to Sign In page
        response.sendRedirect(request.getContextPath() + "/html/USER/signInSignUp/signIn.jsp");
    }
}

