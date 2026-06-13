
package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hms.db.DBConnection;
import com.hms.model.Bill;

public class BillDAO {

    Connection con = null;

    public boolean addBill(Bill b) {

        boolean status = false;

        try {

            con = DBConnection.getConnection();

            String query =
            "INSERT INTO bills(patient_name, doctor_name, amount, payment_status) VALUES(?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, b.getPatientName());
            ps.setString(2, b.getDoctorName());
            ps.setDouble(3, b.getAmount());
            ps.setString(4, b.getPaymentStatus());

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