
package com.hms.model;

public class Medicine {

    private int id;

    private String medicineName;

    private String category;

    private int stockQuantity;

    private double price;

    // GET ID

    public int getId(){

        return id;
    }

    public void setId(int id){

        this.id = id;
    }

    // GET MEDICINE NAME

    public String getMedicineName(){

        return medicineName;
    }

    public void setMedicineName(
            String medicineName){

        this.medicineName =
        medicineName;
    }

    // GET CATEGORY

    public String getCategory(){

        return category;
    }

    public void setCategory(
            String category){

        this.category =
        category;
    }

    // GET STOCK QUANTITY

    public int getStockQuantity(){

        return stockQuantity;
    }

    public void setStockQuantity(
            int stockQuantity){

        this.stockQuantity =
        stockQuantity;
    }

    // GET PRICE

    public double getPrice(){

        return price;
    }

    public void setPrice(
            double price){

        this.price = price;
    }
}