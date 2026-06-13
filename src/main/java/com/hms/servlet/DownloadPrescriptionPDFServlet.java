
package com.hms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.DBConnection;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/DownloadPrescriptionPDFServlet")
public class DownloadPrescriptionPDFServlet
extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");

        response.setHeader(
        "Content-Disposition",
        "attachment; filename=Prescription.pdf");

        try {

            int id =
            Integer.parseInt(
            request.getParameter("id"));

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM prescriptions WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs =
            ps.executeQuery();

            Document document =
            new Document();

            PdfWriter.getInstance(
            document,
            response.getOutputStream());

            document.open();

            document.add(
            new Paragraph(
            "HOSPITAL PRESCRIPTION"));

            document.add(
            new Paragraph(
            "-----------------------------------"));

            if(rs.next()) {

                document.add(
                new Paragraph(
                "Prescription ID: "
                + rs.getInt("id")));

                document.add(
                new Paragraph(
                "Patient Name: "
                + rs.getString("patient_name")));

                document.add(
                new Paragraph(
                "Doctor Name: "
                + rs.getString("doctor_name")));

                document.add(
                new Paragraph(
                "Diagnosis: "
                + rs.getString("diagnosis")));

                document.add(
                new Paragraph(
                "Medicines: "
                + rs.getString("medicines")));

                document.add(
                new Paragraph(
                "Notes: "
                + rs.getString("notes")));
            }

            document.close();

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}