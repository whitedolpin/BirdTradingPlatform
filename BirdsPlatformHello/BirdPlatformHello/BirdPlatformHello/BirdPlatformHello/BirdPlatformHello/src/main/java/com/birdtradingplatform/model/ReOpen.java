/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.birdtradingplatform.model;

/**
 *
 * @author Admin
 */
public class ReOpen {
    private int accountID;
    private String block;
    private String open;

    public ReOpen() {
    }

    public ReOpen(int accountID, String block, String open) {
        this.accountID = accountID;
        this.block = block;
        this.open = open;
    }

    public int getAccountID() {
        return accountID;
    }

    public String getBlock() {
        return block;
    }

    public String getOpen() {
        return open;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public void setOpen(String open) {
        this.open = open;
    }
    
    
    
}
