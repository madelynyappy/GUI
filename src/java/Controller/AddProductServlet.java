/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author Madelyn Yap
 */

import jakarta.servlet.http.Part;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import model.*;

@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
    System.out.println("Reading form parameters...");
    String productName = request.getParameter("productName");
    String productDescription = request.getParameter("productDescription");
    double productPrice = Double.parseDouble(request.getParameter("productPrice"));
    String categoryID = request.getParameter("categoryID");

    System.out.println("Form Data Read:");
    System.out.println("Name: " + productName);
    System.out.println("Description: " + productDescription);
    System.out.println("Price: " + productPrice);
    System.out.println("CategoryID: " + categoryID);

    System.out.println("Reading uploaded file...");
    
// Reading uploaded file
/*
Part filePart = request.getPart("productImage");
String fileName = new File(filePart.getSubmittedFileName()).getName();

String uploadPath = getServletContext().getRealPath("/uploads");
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) {
    uploadDir.mkdirs();
}

filePart.write(uploadPath + File.separator + fileName);
System.out.println("File uploaded successfully: " + fileName);
*/



    System.out.println("Connecting to database...");
    Connection conn = DBConnector.getConnection();

    System.out.println("Inserting into Product table...");
    PreparedStatement psProduct = conn.prepareStatement(
        "INSERT INTO Product (ProductID, ProductName, ProductDescription, ProductPrice, CategoryID) VALUES (?, ?, ?, ?, ?)"
    );

    // Temporary ProductID generation
    String productID = "P" + System.currentTimeMillis()%10000;
    psProduct.setString(1, productID);
    psProduct.setString(2, productName);
    psProduct.setString(3, productDescription);
    psProduct.setDouble(4, productPrice);
    psProduct.setString(5, categoryID);

    psProduct.executeUpdate();
    System.out.println("Product inserted.");

    /*
    System.out.println("Inserting into ProductImage table...");
    PreparedStatement psImage = conn.prepareStatement(
        "INSERT INTO ProductImage (ProductID, ImageName) VALUES (?, ?)"
    );
    psImage.setString(1, productID);
    psImage.setString(2, fileName);
    psImage.executeUpdate();
    System.out.println("Product Image inserted.");

*/
    conn.close();
    System.out.println("Connection closed.");

    // Redirect
    response.sendRedirect(request.getContextPath() + "/html/STAFF/product/productListTest.jsp");
}
catch (Exception ex) {
    ex.printStackTrace(); // print detailed error in server log
    response.sendRedirect(request.getContextPath() + "/html/ERROR/500error.jsp"); 
}

    }
}
