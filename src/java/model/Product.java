/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Madelyn Yap
 */

public class Product {
    private String productID;
    private String productName;
    private String productDescription;
    private double productPrice;
    private String categoryID;

    public Product() {}

    // Getters and Setters
    public String getProductID() {
        return productID;
    }
    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getCategoryID() {
        return categoryID;
    }
    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }
    
    //promotion 
    private int discount;

public int getDiscount() {
    return discount;
}

public void setDiscount(int discount) {
    this.discount = discount;
}

}
