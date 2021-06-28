package com.example.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "categories")
public class Categories {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int categoryId;
    private String categoryName;
    private String categoryDescription;

    @OneToMany(mappedBy="categories")
    private List<Product> product=new ArrayList<>();

    public Categories(int categoryId, String categoryName, String categotyDescription) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryDescription = categotyDescription;
    }

    public Categories(String categoryName, String categotyDescription, List<Product> product) {
        this.categoryName = categoryName;
        this.categoryDescription = categotyDescription;
        this.product = product;
    }

    public Categories() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }



    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 59 * hash + this.categoryId;
        hash = 59 * hash + Objects.hashCode(this.categoryName);
        hash = 59 * hash + Objects.hashCode(this.categoryDescription);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Categories other = (Categories) obj;
        if (this.categoryId != other.categoryId) {
            return false;
        }
        if (!Objects.equals(this.categoryName, other.categoryName)) {
            return false;
        }
        if (!Objects.equals(this.categoryDescription, other.categoryDescription)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Categories{" + "categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryDescription=" + categoryDescription + '}';
    }



}
