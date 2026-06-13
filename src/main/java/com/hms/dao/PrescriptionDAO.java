
package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hms.db.DBConnection;
import com.hms.model.Prescription;

public class PrescriptionDAO {

    public boolean addPrescription(
            Prescription p) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "INSERT INTO prescriptions "
            + "(patient_name, doctor_name, diagnosis, medicines, notes) "
            + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1,
            p.getPatientName());

            ps.setString(2,
            p.getDoctorName());

            ps.setString(3,
            p.getDiagnosis());

            ps.setString(4,
            p.getMedicines());

            ps.setString(5,
            p.getNotes());

            int rows =
            ps.executeUpdate();

            if(rows > 0) {

                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}