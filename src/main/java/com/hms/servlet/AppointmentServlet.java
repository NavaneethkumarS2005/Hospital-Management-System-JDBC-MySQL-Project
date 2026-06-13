package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.AppointmentDAO;
import com.hms.model.Appointment;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String patientName =
        request.getParameter("patientName");

        String doctorName =
        request.getParameter("doctorName");

        String appointmentDate =
        request.getParameter("appointmentDate");

        String status =
        request.getParameter("status");

        Appointment ap = new Appointment();

        ap.setPatientName(patientName);
        ap.setDoctorName(doctorName);
        ap.setAppointmentDate(appointmentDate);
        ap.setStatus(status);

        AppointmentDAO dao =
        new AppointmentDAO();

        boolean result =
        dao.bookAppointment(ap);

        if(result) {

            response.getWriter().println(
                "Appointment Booked Successfully"
            );

        } else {

            response.getWriter().println(
                "Appointment Booking Failed"
            );
        }
    }
}