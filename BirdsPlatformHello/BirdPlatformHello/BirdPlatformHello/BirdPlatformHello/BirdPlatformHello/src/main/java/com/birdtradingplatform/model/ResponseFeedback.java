/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.model;

/**
 *
 * @author Admin
 */
public class ResponseFeedback {
    private int ResponseID;
    private Feedback feedback;
    private String detail;

    public ResponseFeedback() {
    }

    public ResponseFeedback(int ResponseID, Feedback feedback, String detail) {
        this.ResponseID = ResponseID;
        this.feedback = feedback;
        this.detail = detail;
    }

    public int getResponseID() {
        return ResponseID;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public String getDetail() {
        return detail;
    }

    public void setResponseID(int ResponseID) {
        this.ResponseID = ResponseID;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
    
    
}
