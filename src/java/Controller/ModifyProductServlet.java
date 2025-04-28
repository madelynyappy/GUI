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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import model.*;

@WebServlet("/ModifyProductServlet")
@MultipartConfig
public class ModifyProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            String categoryID = request.getParameter("categoryID");

            Part filePart = request.getPart("productImage");
            String fileName = new File(filePart.getSubmittedFileName()).getName();
            
            Connection conn = DBConnector.getConnection();
            
            // Update Product info
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE Product SET ProductName=?, ProductDescription=?, ProductPrice=?, CategoryID=? WHERE ProductID=?"
            );
            ps.setString(1, productName);
            ps.setString(2, productDescription);
            ps.setDouble(3, productPrice);
            ps.setString(4, categoryID);
            ps.setString(5, productID);

            ps.executeUpdate();
            
            // If new image uploaded, update image
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("/uploads");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                filePart.write(uploadPath + File.separator + fileName);

                PreparedStatement psImage = conn.prepareStatement(
                    "UPDATE ProductImage SET ImageName=? WHERE ProductID=?"
                );
                psImage.setString(1, fileName);
                psImage.setString(2, productID);
                psImage.executeUpdate();
            }
            
            conn.close();
            response.sendRedirect(request.getContextPath() + "/html/STAFF/product/productListTest.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}

