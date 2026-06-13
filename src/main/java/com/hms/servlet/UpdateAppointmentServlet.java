
package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.DBConnection;

@WebServlet("/UpdateAppointmentServlet")

public class UpdateAppointmentServlet
extends HttpServlet {

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        int id =

        Integer.parseInt(
        request.getParameter("id"));

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

        try {

            Connection con =

            DBConnection.getConnection();

            String query =

            "UPDATE appointments SET patient_name=?, doctor_name=?, appointment_date=?, status=? WHERE id=?";

            PreparedStatement ps =

            con.prepareStatement(query);

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

            ps.setInt(
            5,
            id);

            int i =

            ps.executeUpdate();

            if(i > 0){

                response.sendRedirect(
                "GetAppointmentsServlet");
            }

            else{

                response.getWriter().println(
                "Appointment Update Failed");
            }

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}