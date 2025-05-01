/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import model.*;

@WebServlet("/ModifyProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class ModifyProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try (Connection conn = DBConnector.getConnection()) {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            String categoryID = request.getParameter("categoryID");

            System.out.println("[ModifyProductServlet] Editing productID: " + productID);

            // Update Product table
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE Product SET ProductName=?, ProductDescription=?, ProductPrice=?, CategoryID=? WHERE ProductID=?")) {
                ps.setString(1, productName);
                ps.setString(2, productDescription);
                ps.setDouble(3, productPrice);
                ps.setString(4, categoryID);
                ps.setString(5, productID);

                   int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated == 0) {
                    throw new SQLException("No product found with ID: " + productID);
                }
            }

            // Handle image upload if a new image is provided
            Part filePart = request.getPart("productImage");
            if (filePart != null && filePart.getSize() > 0) {
                String submittedFileName = filePart.getSubmittedFileName();

                if (submittedFileName != null && !submittedFileName.isEmpty()) {
                    String timestamp = String.valueOf(System.currentTimeMillis());
                    String originalFileName = new File(submittedFileName).getName();
                    String extension = originalFileName.contains(".")
                            ? originalFileName.substring(originalFileName.lastIndexOf("."))
                            : ".jpg";
                    String fileName = originalFileName.replaceAll("\\.[^.]*$", "") + "-" + timestamp + extension;

                    // Create upload directory
                    String uploadPath = getServletContext().getRealPath("/image/upload/" + productID);
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    filePart.write(uploadPath + File.separator + fileName);

                    // Store relative path in DB
                    String dbPath = "image/upload/" + productID + "/" + fileName;

                    try (PreparedStatement psImage = conn.prepareStatement(
                            "UPDATE ProductImage SET imagename=?, description=?, path=? WHERE productid=?")) {
                        psImage.setString(1, fileName);
                        psImage.setString(2, "Product image for " + productName);
                        psImage.setString(3, dbPath);
                        psImage.setString(4, productID);
                        psImage.executeUpdate();
                    }
                }
            }

            response.sendRedirect(request.getContextPath() + "/html/STAFF/product/productListTest.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
        }
    }
}