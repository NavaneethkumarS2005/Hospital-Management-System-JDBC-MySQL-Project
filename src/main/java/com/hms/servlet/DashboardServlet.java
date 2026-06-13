
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

@WebServlet("/DashboardServlet")

public class DashboardServlet
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

        try{

            Connection con =
            DBConnection.getConnection();

            int patientCount = 0;
            int doctorCount = 0;
            int appointmentCount = 0;
            int billCount = 0;

            // TOTAL PATIENTS

            PreparedStatement ps1 =
            con.prepareStatement(
            "SELECT COUNT(*) FROM patients");

            ResultSet rs1 =
            ps1.executeQuery();

            if(rs1.next()){

                patientCount =
                rs1.getInt(1);
            }

            // TOTAL DOCTORS

            PreparedStatement ps2 =
            con.prepareStatement(
            "SELECT COUNT(*) FROM doctors");

            ResultSet rs2 =
            ps2.executeQuery();

            if(rs2.next()){

                doctorCount =
                rs2.getInt(1);
            }

            // TOTAL APPOINTMENTS

            PreparedStatement ps3 =
            con.prepareStatement(
            "SELECT COUNT(*) FROM appointments");

            ResultSet rs3 =
            ps3.executeQuery();

            if(rs3.next()){

                appointmentCount =
                rs3.getInt(1);
            }

            // TOTAL BILLS

            PreparedStatement ps4 =
            con.prepareStatement(
            "SELECT COUNT(*) FROM bills");

            ResultSet rs4 =
            ps4.executeQuery();

            if(rs4.next()){

                billCount =
                rs4.getInt(1);
            }

            // APPOINTMENT REMINDERS

            String reminderQuery =

            "SELECT patient_name, doctor_name " +
            "FROM appointments " +
            "WHERE appointment_date = CURDATE()";

            PreparedStatement reminderPs =
            con.prepareStatement(
            reminderQuery);

            ResultSet reminderRs =
            reminderPs.executeQuery();

            ArrayList<String> reminders =
            new ArrayList<>();

            while(reminderRs.next()){

                reminders.add(

                reminderRs.getString(
                "patient_name")

                + " with "

                + reminderRs.getString(
                "doctor_name")
                );
            }

            // DISEASE ANALYTICS

            String diseaseQuery =

            "SELECT disease, COUNT(*) AS total " +
            "FROM patients " +
            "GROUP BY disease " +
            "ORDER BY total DESC " +
            "LIMIT 5";

            PreparedStatement diseasePs =
            con.prepareStatement(
            diseaseQuery);

            ResultSet diseaseRs =
            diseasePs.executeQuery();

            ArrayList<String> diseases =
            new ArrayList<>();

            while(diseaseRs.next()){

                diseases.add(

                diseaseRs.getString(
                "disease")

                + " → "

                + diseaseRs.getInt(
                "total")
                );
            }

            // SEND DATA TO JSP

            request.setAttribute(
            "patientCount",
            patientCount);

            request.setAttribute(
            "doctorCount",
            doctorCount);

            request.setAttribute(
            "appointmentCount",
            appointmentCount);

            request.setAttribute(
            "billCount",
            billCount);

            request.setAttribute(
            "reminders",
            reminders);

            request.setAttribute(
            "diseases",
            diseases);

            // OPEN DASHBOARD

            request.getRequestDispatcher(
            "dashboard.jsp")
            .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}