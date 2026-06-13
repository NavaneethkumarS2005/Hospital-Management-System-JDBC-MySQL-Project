
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

@WebServlet("/GetPrescriptionsServlet")
public class GetPrescriptionsServlet
extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
        response.getWriter();

        out.println("<html>");

        out.println("<head>");

        out.println("<title>Prescriptions List</title>");

        out.println(
        "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>"
        );

        out.println("</head>");

        out.println(
        "<body class='bg-light' style='overflow-x:hidden;'>"
        );

        // SIDEBAR

        out.println(
        "<div class='bg-dark text-white p-3 vh-100' "
        + "style='width:250px; position:fixed; top:0; left:0;'>"

        + "<h3 class='text-center mb-4'>HMS Panel</h3>"

        + "<ul class='nav flex-column'>"

        + "<li class='nav-item mb-2'>"
        + "<a href='DashboardServlet' class='nav-link text-white'>Dashboard</a>"
        + "</li>"

        + "<li class='nav-item mb-2'>"
        + "<a href='javascript:history.back()' class='nav-link text-white'>Back</a>"
        + "</li>"

        + "</ul>"

        + "</div>"
        );

        // CONTENT

        out.println(
        "<div style='margin-left:270px; padding:30px;'>"
        );

        out.println(
        "<h2 class='mb-4 fw-bold'>Prescriptions List</h2>"
        );

        // TABLE

        out.println(
        "<table class='table table-bordered table-hover shadow bg-white align-middle'>"
        );

        out.println("<thead class='table-dark'>");

        out.println("<tr>");

        out.println("<th>ID</th>");
        out.println("<th>Patient Name</th>");
        out.println("<th>Doctor Name</th>");
        out.println("<th>Diagnosis</th>");
        out.println("<th>Medicines</th>");
        out.println("<th>Notes</th>");
        out.println("<th>PDF</th>");
        out.println("</tr>");

        out.println("</thead>");

        out.println("<tbody>");

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "SELECT * FROM prescriptions";

            PreparedStatement ps =
            con.prepareStatement(query);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                out.println("<tr>");

                out.println("<td>"
                + rs.getInt("id")
                + "</td>");

                out.println("<td>"
                + rs.getString("patient_name")
                + "</td>");

                out.println("<td>"
                + rs.getString("doctor_name")
                + "</td>");

                out.println("<td>"
                + rs.getString("diagnosis")
                + "</td>");

                out.println("<td>"
                + rs.getString("medicines")
                + "</td>");

                out.println("<td>"
                + rs.getString("notes")
                + "</td>");
                
                		out.println("<td>");

                		out.println(
                		"<a href='DownloadPrescriptionPDFServlet?id="
                		+ rs.getInt("id")
                		+ "' class='btn btn-primary btn-sm'>Download PDF</a>"
                		);

                		out.println("</td>");
                		
                out.println("</tr>");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        out.println("</tbody>");

        out.println("</table>");

        out.println("</div>");

        out.println("</body>");

        out.println("</html>");
    }
}
