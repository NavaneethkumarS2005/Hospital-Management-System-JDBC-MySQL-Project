
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
import com.hms.model.Appointment;

@WebServlet("/GetAppointmentsServlet")

public class GetAppointmentsServlet
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

        ArrayList<Appointment> appointments =

        new ArrayList<>();

        try{

            Connection con =

            DBConnection.getConnection();

            // SMART SORTING

            String query =

            "SELECT * FROM appointments " +

            "ORDER BY " +

            "CASE " +

            "WHEN status='Emergency' THEN 1 " +

            "WHEN status='Confirmed' THEN 2 " +

            "ELSE 3 END, " +

            "appointment_date ASC";

            PreparedStatement ps =

            con.prepareStatement(query);

            ResultSet rs =

            ps.executeQuery();

            while(rs.next()){

                Appointment ap =

                new Appointment();

                ap.setId(
                rs.getInt("id"));

                ap.setPatientName(
                rs.getString("patient_name"));

                ap.setDoctorName(
                rs.getString("doctor_name"));

                ap.setAppointmentDate(
                rs.getString("appointment_date"));

                ap.setStatus(
                rs.getString("status"));

                appointments.add(ap);
            }

            // SEND TO JSP

            request.setAttribute(

            "appointments",

            appointments);

            // OPEN PAGE

            request.getRequestDispatcher(
            "appointment.jsp")

            .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}

