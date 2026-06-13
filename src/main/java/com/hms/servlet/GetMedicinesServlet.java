
package com.hms.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.hms.db.DBConnection;
import com.hms.model.Medicine;

@WebServlet("/GetMedicinesServlet")

public class GetMedicinesServlet
extends HttpServlet {

    protected void doGet(

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

        ArrayList<Medicine> medicines =

        new ArrayList<>();

        try{

            Connection con =

            DBConnection.getConnection();

            String query =

            "SELECT * FROM medicines " +

            "ORDER BY stock_quantity ASC";

            PreparedStatement ps =

            con.prepareStatement(
            query);

            ResultSet rs =

            ps.executeQuery();

            while(rs.next()){

                Medicine medicine =

                new Medicine();

                medicine.setId(
                rs.getInt("id"));

                medicine.setMedicineName(
                rs.getString("medicine_name"));

                medicine.setCategory(
                rs.getString("category"));

                medicine.setStockQuantity(
                rs.getInt("stock_quantity"));

                medicine.setPrice(
                rs.getDouble("price"));

                medicines.add(
                medicine);
            }

            request.setAttribute(
            "medicines",
            medicines);

            request.getRequestDispatcher(
            "pharmacy.jsp")

            .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}