/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Madelyn Yap
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT p.*, pd.discount, pd.promotionEnabled " +
                    "FROM Product p " +
                    "LEFT JOIN productDiscount pd ON p.productID = pd.productID";
        PreparedStatement stmt = connection.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Product p = new Product();
            p.setProductID(rs.getString("ProductID"));
            p.setProductName(rs.getString("ProductName"));
            p.setProductDescription(rs.getString("ProductDescription"));
            p.setProductPrice(rs.getDouble("ProductPrice"));
            p.setCategoryID(rs.getString("CategoryID"));
            p.setDiscount(rs.getInt("discount"));
            p.setPromotionEnabled(rs.getBoolean("promotionEnabled"));
            p.setProductImageList(getProductImage(rs.getString("ProductID")));
            productList.add(p);
        }
        return productList;
    }
    
    //edit product servlet
    public Product getProductByID(String productID) throws SQLException {
        Product product = null;
        
        String sql = "SELECT p.*, pd.discount, pd.promotionEnabled " +
                    "FROM Product p " +
                    "LEFT JOIN productDiscount pd ON p.productID = pd.productID " +
                    "WHERE p.ProductID = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, productID);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            product = new Product();
            product.setProductID(rs.getString("ProductID"));
            product.setProductName(rs.getString("ProductName"));
            product.setProductDescription(rs.getString("ProductDescription"));
            product.setProductPrice(rs.getDouble("ProductPrice"));
            product.setCategoryID(rs.getString("CategoryID"));
            product.setDiscount(rs.getInt("discount"));
            product.setPromotionEnabled(rs.getBoolean("promotionEnabled"));
            product.setProductImageList(getProductImage(productID));
        }
        
        rs.close();
        ps.close();
        
        return product;
    }

     //promotion 
   public List<Product> getDiscountedProducts() throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, pd.discount, pd.promotionEnabled " +
                    "FROM Product p " +
                    "JOIN productDiscount pd ON p.productID = pd.productID " +
                    "WHERE pd.discount > 0 AND pd.promotionEnabled = true";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product();
            p.setProductID(rs.getString("productID"));
            p.setProductName(rs.getString("productName"));
            p.setProductDescription(rs.getString("productDescription"));
            p.setProductPrice(rs.getDouble("productPrice"));
            p.setCategoryID(rs.getString("categoryID"));
            p.setDiscount(rs.getInt("discount"));
            p.setPromotionEnabled(rs.getBoolean("promotionEnabled"));
            list.add(p);
        }
        return list;
   }

    private List<ProductImage> getProductImage(String productID) throws SQLException {
        List<ProductImage> productImageList = new ArrayList<>();
        
        String sql = "SELECT * FROM ProductImage WHERE ProductID = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, productID);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            ProductImage pi = new ProductImage();
            pi.setImageID(rs.getInt("imageID"));
            pi.setProductID(rs.getString("productID"));
            pi.setImageName(rs.getString("ImageName"));
            pi.setDescription(rs.getString("description"));
            pi.setPath(rs.getString("path"));
            productImageList.add(pi);
        }
        return productImageList;
    }

    public List<Product> getProductsByCategory(String categoryID) throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT p.*, pd.discount, pd.promotionEnabled " +
                    "FROM Product p " +
                    "LEFT JOIN productDiscount pd ON p.productID = pd.productID " +
                    "WHERE p.CategoryID = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, categoryID);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Product p = new Product();
            p.setProductID(rs.getString("ProductID"));
            p.setProductName(rs.getString("ProductName"));
            p.setProductDescription(rs.getString("ProductDescription"));
            p.setProductPrice(rs.getDouble("ProductPrice"));
            p.setCategoryID(rs.getString("CategoryID"));
            p.setDiscount(rs.getInt("discount"));
            p.setPromotionEnabled(rs.getBoolean("promotionEnabled"));
            p.setProductImageList(getProductImage(rs.getString("ProductID")));
            productList.add(p);
        }
        return productList;
    }
}