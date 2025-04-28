/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Madelyn Yap
 */

public class ProductImage {
    private int imageID;
    private String productID;
    private String imageName; // Only the filename, e.g., dumbbell1.png

    public ProductImage() {}

    // Getters and Setters
    public int getImageID() {
        return imageID;
    }
    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public String getProductID() {
        return productID;
    }
    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getImageName() {
        return imageName;
    }
    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
}
