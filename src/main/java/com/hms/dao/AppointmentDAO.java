package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hms.db.DBConnection;
import com.hms.model.Appointment;

public class AppointmentDAO {

    Connection con = null;

    public boolean bookAppointment(Appointment ap) {

        boolean status = false;

        try {

            con = DBConnection.getConnection();

            String query =
            "INSERT INTO appointments(patient_name, doctor_name, appointment_date, status) VALUES(?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, ap.getPatientName());
            ps.setString(2, ap.getDoctorName());
            ps.setString(3, ap.getAppointmentDate());
            ps.setString(4, ap.getStatus());

            int i = ps.executeUpdate();

            if(i > 0) {

                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}