
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
import com.hms.model.Appointment;

@WebServlet("/DeleteAppointmentsServlet")
public class DeleteAppointmentServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        ArrayList<Appointment> appointmentList =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM appointments";

            PreparedStatement ps =
            con.prepareStatement(query);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Appointment a =
                new Appointment();

                a.setId(
                rs.getInt("id"));

                a.setPatientName(
                rs.getString("patient_name"));

                a.setDoctorName(
                rs.getString("doctor_name"));

                a.setAppointmentDate(
                rs.getString("appointment_date"));

                a.setStatus(
                rs.getString("status"));

                appointmentList.add(a);
            }

            request.setAttribute(
            "appointments",
            appointmentList);

            request.getRequestDispatcher(
            "appointments.jsp")
            .forward(request, response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}