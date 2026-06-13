
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

import com.hms.db.DBConnection;

import com.hms.model.Doctor;

@WebServlet("/GetDoctorsServlet")

public class GetDoctorsServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        ArrayList<Doctor> doctorList =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM doctor_users";

            PreparedStatement ps =
            con.prepareStatement(query);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Doctor d =
                new Doctor();

                d.setId(
                rs.getInt("id"));

                d.setDoctorName(
                rs.getString("doctor_name"));

                d.setSpecialization(
                rs.getString("specialization"));

                d.setExperience(
                rs.getInt("experience"));

                d.setPhone(
                rs.getString("phone"));

                doctorList.add(d);
            }

            request.setAttribute(
            "doctors",
            doctorList);

            request.getRequestDispatcher(
            "doctor.jsp")

            .forward(request, response);

        }

        catch(Exception e) {

            e.printStackTrace();
        }
    }
}