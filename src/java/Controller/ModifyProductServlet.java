/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
import java.sql.ResultSet;
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
                    throw new Exception("No product found with ID: " + productID);
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
                    String webRootPath = getServletContext().getRealPath("/");
                    if (webRootPath == null) {
                        System.out.println("[ModifyProductServlet] Web root path is null");
                        response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
                        return;
                    }

                    // Create the upload directory path relative to web root
                    String uploadDirPath = "images" + File.separator + "upload" + File.separator + productID;

                    // Create the directory if it doesn't exist
                    File uploadDir = new File(webRootPath + uploadDirPath);
                    if (!uploadDir.exists()) {
                        boolean created = uploadDir.mkdirs();
                        if (!created) {
                            System.out.println("[ModifyProductServlet] Failed to create upload directory: " + webRootPath + uploadDirPath);
                            response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
                            return;
                        }
                    }

                    // Create the full file path
                    String filePath = uploadDirPath + File.separator + fileName;
                    
                    try {
                        // Create the target file
                        File targetFile = new File(webRootPath + filePath);
                        
                        // Write the file using InputStream and OutputStream
                        try (InputStream fileContent = filePart.getInputStream();
                             OutputStream out = new FileOutputStream(targetFile)) {
                            byte[] buffer = new byte[1024];
                            int length;
                            while ((length = fileContent.read(buffer)) > 0) {
                                out.write(buffer, 0, length);
                            }
                        }
                        System.out.println("[ModifyProductServlet] File uploaded successfully: " + fileName);
                    } catch (IOException e) {
                        System.out.println("[ModifyProductServlet] Error writing file: " + e.getMessage());
                        response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp");
                        return;
                    }

                    // Store relative path in DB
                    String dbPath = "images/upload/" + productID + "/" + fileName;
                    System.out.println("[ModifyProductServlet] DB path: " + dbPath);

                    // Check if image record exists
                    try (PreparedStatement checkPs = conn.prepareStatement(
                            "SELECT COUNT(*) FROM ProductImage WHERE productid = ?")) {
                        checkPs.setString(1, productID);
                        ResultSet rs = checkPs.executeQuery();
                        rs.next();
                        int count = rs.getInt(1);

                        if (count > 0) {
                            // Update existing record
                            try (PreparedStatement psImage = conn.prepareStatement(
                                    "UPDATE ProductImage SET imagename=?, description=?, path=? WHERE productid=?")) {
                                psImage.setString(1, fileName);
                                psImage.setString(2, "Product image for " + productName);
                                psImage.setString(3, dbPath);
                                psImage.setString(4, productID);
                                psImage.executeUpdate();
                                System.out.println("[ModifyProductServlet] Updated existing image record in database");
                            }
                        } else {
                            // Insert new record
                            try (PreparedStatement psImage = conn.prepareStatement(
                                    "INSERT INTO ProductImage (productid, imagename, description, path) VALUES (?, ?, ?, ?)")) {
                                psImage.setString(1, productID);
                                psImage.setString(2, fileName);
                                psImage.setString(3, "Product image for " + productName);
                                psImage.setString(4, dbPath);
                                psImage.executeUpdate();
                                System.out.println("[ModifyProductServlet] Inserted new image record in database");
                            }
                        }
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