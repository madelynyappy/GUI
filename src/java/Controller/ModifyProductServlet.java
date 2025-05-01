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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ModifyProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            String categoryID = request.getParameter("categoryID");
            
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
            
            // Handle image upload if new image provided
            Part filePart = request.getPart("productImage");
            if (filePart != null && filePart.getSize() > 0) {
                String originalFileName = new File(filePart.getSubmittedFileName()).getName();
                String timestamp = String.valueOf(System.currentTimeMillis());
                String fileName = originalFileName.substring(0, originalFileName.lastIndexOf('.')) + "-" + timestamp + ".jpg";

                // Create upload directory using productID
                String uploadPath = getServletContext().getRealPath("/image/upload/" + productID);
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Write file to directory
                filePart.write(uploadPath + File.separator + fileName);

                // Update ProductImage table
                PreparedStatement psImage = conn.prepareStatement(
                    "UPDATE ProductImage SET imagename=?, description=?, path=? WHERE productid=?"
                );
                psImage.setString(1, fileName);
                psImage.setString(2, "Product image for " + productName);
                psImage.setString(3, uploadPath + File.separator + fileName);
                psImage.setString(4, productID);
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