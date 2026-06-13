
package com.hms.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.hms.db.DBConnection;

@WebServlet("/AddMedicineServlet")

public class AddMedicineServlet
extends HttpServlet {

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        // SESSION PROTECTION

        HttpSession session =

        request.getSession(false);

        if(session == null
           || session.getAttribute("user") == null){

            response.sendRedirect(
            "login.jsp");

            return;
        }

        String medicineName =

        request.getParameter(
        "medicineName");

        String category =

        request.getParameter(
        "category");

        int stockQuantity =

        Integer.parseInt(

        request.getParameter(
        "stockQuantity"));

        double price =

        Double.parseDouble(

        request.getParameter(
        "price"));

        try{

            Connection con =

            DBConnection.getConnection();

            String query =

            "INSERT INTO medicines " +

            "(medicine_name, category, stock_quantity, price) " +

            "VALUES(?,?,?,?)";

            PreparedStatement ps =

            con.prepareStatement(
            query);

            ps.setString(
            1,
            medicineName);

            ps.setString(
            2,
            category);

            ps.setInt(
            3,
            stockQuantity);

            ps.setDouble(
            4,
            price);

            int i =

            ps.executeUpdate();

            if(i > 0){

                session.setAttribute(

                "medicineMessage",

                "Medicine added successfully!");
            }

            else{

                session.setAttribute(

                "medicineMessage",

                "Failed to add medicine!");
            }

            response.sendRedirect(
            "GetMedicinesServlet");

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}