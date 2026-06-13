
package com.hms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.db.DBConnection;

@WebServlet("/SearchPatientServlet")
public class SearchPatientServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String patientName =
        request.getParameter("patientName");

        out.println("<html>");
        out.println("<head>");

        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");

        out.println("</head>");

        out.println("<body class='bg-light'>");

        out.println("<div class='container mt-5'>");

        out.println("<h2 class='mb-4 text-center'>Patient Search Results</h2>");

        out.println("<table class='table table-bordered table-striped'>");

        out.println("<tr>");

        out.println("<th>ID</th>");
        out.println("<th>Patient Name</th>");
        out.println("<th>Age</th>");
        out.println("<th>Gender</th>");
        out.println("<th>Disease</th>");
        out.println("<th>Phone</th>");

        out.println("</tr>");

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM patients WHERE patient_name LIKE ?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, "%" + patientName + "%");

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                out.println("<tr>");

                out.println("<td>" +
                rs.getInt("id")
                + "</td>");

                out.println("<td>" +
                rs.getString("patient_name")
                + "</td>");

                out.println("<td>" +
                rs.getInt("age")
                + "</td>");

                out.println("<td>" +
                rs.getString("gender")
                + "</td>");

                out.println("<td>" +
                rs.getString("disease")
                + "</td>");

                out.println("<td>" +
                rs.getString("phone")
                + "</td>");

                out.println("</tr>");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        out.println("</table>");

        out.println("</div>");

        out.println("</body>");
        out.println("</html>");
    }
}
