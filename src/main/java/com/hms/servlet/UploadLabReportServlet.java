
package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.DBConnection;

@WebServlet("/UploadLabReportServlet")

public class UploadLabReportServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException,
            IOException {

        String patientName =
        request.getParameter(
        "patientName");

        String testName =
        request.getParameter(
        "testName");

        String reportResult =
        request.getParameter(
        "reportResult");

        try {

            Connection con =
            DBConnection.getConnection();

            String query =

            "INSERT INTO lab_reports(patient_name,test_name,result) VALUES(?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, patientName);

            ps.setString(2, testName);

            ps.setString(3, reportResult);

            int i =
            ps.executeUpdate();

            if(i > 0){

                response.sendRedirect(
                "GetLabReportsServlet");

            } else {

                response.getWriter().println(
                "Upload Failed");
            }

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}
