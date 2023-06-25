/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birdtradingplatform.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author leyen
 */
public class Utils {

    public static final String DATE_FORMAT = "yyyy-MM-dd";

    public static Date toDate(String strDate) throws ParseException {
        if (strDate == null) {
            return null;
        }
        SimpleDateFormat df = new SimpleDateFormat(Utils.DATE_FORMAT);
        df.setLenient(false);
        return (Date) df.parse(strDate);
    }

    public static long countTime(Date startDate, Date endDate) {
        long getDiff = endDate.getTime() - startDate.getTime();

        // using TimeUnit class from java.util.concurrent package
        long getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
        return getDaysDiff;

    }
      public static String convertToMonthName(int monthNumber) {
        Month monthEnum = Month.of(monthNumber);
        return monthEnum.getDisplayName(TextStyle.FULL, Locale.getDefault());
    }
    public static long countTime(String startDate, String endDate) throws ParseException{
        return Utils.countTime(toDate(startDate), toDate(endDate));
    }
}
