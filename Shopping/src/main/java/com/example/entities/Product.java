package com.example.entities;

import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int productId;
    private String productName;
    @Column(length=3000)
    private String productDesc;
    private double productPrice;
    private int productQuantity;
    private double productDiscount;
    private String productPhoto;

    @ManyToOne
    private Categories categories;

    public Product(String productName, String productDesc, double productPrice, int productQuantity, double productDiscount, String productPhoto, Categories categories) {
        this.productName = productName;
        this.productDesc = productDesc;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productDiscount = productDiscount;
        this.productPhoto = productPhoto;
        this.categories = this.categories;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public double getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(double productDiscount) {
        this.productDiscount = productDiscount;
    }

    public Categories getCategories() {
        return categories;
    }

    public void setCategories(Categories categories) {
        this.categories = categories;
    }


    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDesc=" + productDesc + ", productPrice=" + productPrice + ", productQuantity=" + productQuantity + ", productDiscount=" + productDiscount + ", productPhoto=" + productPhoto + '}';
    }

    //calculate price after discount
    public int getPriceAfterDiscount()
    {
        int d= (int) ((this.getProductDiscount()/100.0)*this.getProductPrice());
        return (int) (this.getProductPrice()-d);
    }


}

