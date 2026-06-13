
package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hms.db.DBConnection;
import com.hms.model.LabReport;

public class LabReportDAO {

    public boolean addLabReport(
            LabReport l) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "INSERT INTO lab_reports "
            + "(patient_name, test_name, result, report_date, remarks) "
            + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1,
            l.getPatientName());

            ps.setString(2,
            l.getTestName());

            ps.setString(3,
            l.getResult());

            ps.setString(4,
            l.getReportDate());

            ps.setString(5,
            l.getRemarks());

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