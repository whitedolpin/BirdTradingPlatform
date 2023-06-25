/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author leyen
 */
public class OrderHistory extends Order{
    private int totalQuantity;
    private String firstProductName;

    public OrderHistory() {
    }

    public OrderHistory(int totalQuantity, String firstProductName, int orderID, String orderDate, double total, int addressShipID, String shipDate, String status) {
        super(orderID, orderDate, total, addressShipID, shipDate, status);
        this.totalQuantity = totalQuantity;
        this.firstProductName = firstProductName;
    }

    public OrderHistory(int totalQuantity, String firstProductName, int orderID, String orderDate, double total, int paymentID, int customerID, int addressShipID, String shipDate, String status) {
        super(orderID, orderDate, total, paymentID, customerID, addressShipID, shipDate, status);
        this.totalQuantity = totalQuantity;
        this.firstProductName = firstProductName;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public String getFirstProductName() {
        return firstProductName;
    }

    public void setFirstProductName(String firstProductName) {
        this.firstProductName = firstProductName;
    }
    
}
