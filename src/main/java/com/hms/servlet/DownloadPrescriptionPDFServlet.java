
package com.hms.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.DBConnection;

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

            StringBuilder content =
            new StringBuilder();

            if(rs.next()) {

                content.append("HOSPITAL PRESCRIPTION\n");
                content.append("-----------------------------------\n");
                content.append("Prescription ID: ")
                       .append(rs.getInt("id"))
                       .append('\n');
                content.append("Patient Name: ")
                       .append(rs.getString("patient_name"))
                       .append('\n');
                content.append("Doctor Name: ")
                       .append(rs.getString("doctor_name"))
                       .append('\n');
                content.append("Diagnosis: ")
                       .append(rs.getString("diagnosis"))
                       .append('\n');
                content.append("Medicines: ")
                       .append(rs.getString("medicines"))
                       .append('\n');
                content.append("Notes: ")
                       .append(rs.getString("notes"))
                       .append('\n');
            } else {
                content.append("Prescription not found.");
            }

            byte[] pdf =
            createPdf(content.toString());

            response.setContentLength(pdf.length);
            response.getOutputStream().write(pdf);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }

    private byte[] createPdf(String text) {

        String escapedText =
        text.replace("\\", "\\\\")
            .replace("(", "\\(")
            .replace(")", "\\)")
            .replace("\r", "");

        String[] lines =
        escapedText.split("\n");

        StringBuilder pageText =
        new StringBuilder();

        pageText.append("BT /F1 12 Tf 50 780 Td 14 TL ");

        for(String line : lines) {
            pageText.append("(")
                    .append(line)
                    .append(") Tj T* ");
        }

        pageText.append("ET");

        String stream =
        pageText.toString();

        String[] objects =
        new String[] {
            "<< /Type /Catalog /Pages 2 0 R >>",
            "<< /Type /Pages /Kids [3 0 R] /Count 1 >>",
            "<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] "
            + "/Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>",
            "<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>",
            "<< /Length " + stream.getBytes(StandardCharsets.US_ASCII).length
            + " >>\nstream\n" + stream + "\nendstream"
        };

        StringBuilder pdf =
        new StringBuilder("%PDF-1.4\n");

        int[] offsets =
        new int[objects.length + 1];

        for(int i = 0; i < objects.length; i++) {
            offsets[i + 1] =
            pdf.toString().getBytes(StandardCharsets.US_ASCII).length;

            pdf.append(i + 1)
               .append(" 0 obj\n")
               .append(objects[i])
               .append("\nendobj\n");
        }

        int xrefOffset =
        pdf.toString().getBytes(StandardCharsets.US_ASCII).length;

        pdf.append("xref\n0 ")
           .append(objects.length + 1)
           .append("\n0000000000 65535 f \n");

        for(int i = 1; i < offsets.length; i++) {
            pdf.append(String.format("%010d 00000 n \n", offsets[i]));
        }

        pdf.append("trailer\n<< /Size ")
           .append(objects.length + 1)
           .append(" /Root 1 0 R >>\nstartxref\n")
           .append(xrefOffset)
           .append("\n%%EOF");

        return pdf.toString().getBytes(StandardCharsets.US_ASCII);
    }
}
