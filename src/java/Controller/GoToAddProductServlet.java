/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author Madelyn Yap
 * using for JPA transferring
 */

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.persistence.*;
import java.io.IOException;
import java.util.List;
import model.Category;

@WebServlet("/GoToAddProductServlet")
public class GoToAddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManagerFactory emf = (EntityManagerFactory) getServletContext().getAttribute("emf");
        EntityManager em = emf.createEntityManager();

        try {
            List<Category> categoryList = em.createQuery("SELECT c FROM Category c", Category.class).getResultList();
            request.setAttribute("categoryList", categoryList);

            // Corrected this line to match your current working productadd.jsp path
            RequestDispatcher rd = request.getRequestDispatcher("/productadd.jsp");
            rd.forward(request, response);
        } finally {
            em.close();
        }
    }
}
