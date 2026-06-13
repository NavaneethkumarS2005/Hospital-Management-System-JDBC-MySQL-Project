
package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hms.db.DBConnection;
import com.hms.model.DoctorUser;

public class DoctorUserDAO {

    // DOCTOR SIGNUP

    public boolean registerDoctor(
            DoctorUser d) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "INSERT INTO doctor_users "
            + "(doctor_name, email, password, specialization) "
            + "VALUES (?, ?, ?, ?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1,
            d.getDoctorName());

            ps.setString(2,
            d.getEmail());

            ps.setString(3,
            d.getPassword());

            ps.setString(4,
            d.getSpecialization());

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

    // DOCTOR LOGIN

    public DoctorUser loginDoctor(
            String email,
            String password) {

        DoctorUser doctor = null;

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM doctor_users "
            + "WHERE email=? AND password=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, email);

            ps.setString(2, password);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                doctor =
                new DoctorUser();

                doctor.setId(
                rs.getInt("id"));

                doctor.setDoctorName(
                rs.getString("doctor_name"));

                doctor.setEmail(
                rs.getString("email"));

                doctor.setSpecialization(
                rs.getString("specialization"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return doctor;
    }
}