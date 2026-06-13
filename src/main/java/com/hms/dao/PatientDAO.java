
package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hms.db.DBConnection;
import com.hms.model.Patient;

public class PatientDAO {

    Connection con = null;

    public boolean addPatient(Patient p) {

        boolean status = false;

        try {

            con = DBConnection.getConnection();

            String query =
            "INSERT INTO patients(patient_name, age, gender, disease, phone) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, p.getPatientName());
            ps.setInt(2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setString(4, p.getDisease());
            ps.setString(5, p.getPhone());

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