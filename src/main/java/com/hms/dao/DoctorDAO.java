
package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hms.db.DBConnection;
import com.hms.model.Doctor;
public class DoctorDAO {

    Connection con = null;

    public boolean addDoctor(Doctor d) {

        boolean status = false;

        try {

            con = DBConnection.getConnection();

            String query =
            "INSERT INTO doctors(doctor_name, specialization, experience, phone) VALUES(?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, d.getDoctorName());
            ps.setString(2, d.getSpecialization());
            ps.setInt(3, d.getExperience());
            ps.setString(4, d.getPhone());

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