
package com.hms.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.hms.db.DBConnection;

@WebServlet("/AddAppointmentServlet")

public class AddAppointmentServlet
extends HttpServlet {

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        // SESSION CHECK

        HttpSession session =

        request.getSession(false);

        if(session == null
           || session.getAttribute("user") == null){

            response.sendRedirect(
            "login.jsp");

            return;
        }

        String patientName =

        request.getParameter(
        "patientName");

        String doctorName =

        request.getParameter(
        "doctorName");

        String appointmentDate =

        request.getParameter(
        "appointmentDate");

        String status =

        request.getParameter(
        "status");

        try{

            Connection con =

            DBConnection.getConnection();

            // DUPLICATE APPOINTMENT CHECK

            String checkQuery =

            "SELECT * FROM appointments " +

            "WHERE patient_name=? " +

            "AND appointment_date=?";

            PreparedStatement checkPs =

            con.prepareStatement(
            checkQuery);

            checkPs.setString(
            1,
            patientName);

            checkPs.setString(
            2,
            appointmentDate);

            ResultSet rs =

            checkPs.executeQuery();

            if(rs.next()){

                session.setAttribute(

                "appointmentMessage",

                "Appointment already exists!");

                response.sendRedirect(
                "GetAppointmentsServlet");

                return;
            }

            // INSERT APPOINTMENT

            String insertQuery =

            "INSERT INTO appointments " +

            "(patient_name, doctor_name, appointment_date, status) " +

            "VALUES(?,?,?,?)";

            PreparedStatement ps =

            con.prepareStatement(
            insertQuery);

            ps.setString(
            1,
            patientName);

            ps.setString(
            2,
            doctorName);

            ps.setString(
            3,
            appointmentDate);

            ps.setString(
            4,
            status);

            int i =

            ps.executeUpdate();

            if(i > 0){

                session.setAttribute(

                "appointmentMessage",

                "Appointment booked successfully!");

            }

            else{

                session.setAttribute(

                "appointmentMessage",

                "Failed to book appointment!");
            }

            // REDIRECT

            response.sendRedirect(
            "GetAppointmentsServlet");
        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}