
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

import com.hms.db.DBConnection;
import com.hms.model.Patient;

@WebServlet("/GetPatientsServlet")

public class GetPatientsServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        ArrayList<Patient> patientList =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM patients";

            PreparedStatement ps =
            con.prepareStatement(query);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Patient p =
                new Patient();

                p.setId(
                rs.getInt("id"));

                p.setPatientName(
                rs.getString("patient_name"));

                p.setAge(
                rs.getInt("age"));

                p.setGender(
                rs.getString("gender"));

                p.setDisease(
                rs.getString("disease"));

                p.setPhone(
                rs.getString("phone"));

                patientList.add(p);
            }

            request.setAttribute(
            "patients",
            patientList);

            request.getRequestDispatcher(
            "patient.jsp")
            .forward(request, response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}