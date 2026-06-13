
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

@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(request.getParameter("id"));

        String patientName =
        request.getParameter("patientName");

        int age =
        Integer.parseInt(request.getParameter("age"));

        String gender =
        request.getParameter("gender");

        String disease =
        request.getParameter("disease");

        String phone =
        request.getParameter("phone");

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "UPDATE patients SET patient_name=?, age=?, gender=?, disease=?, phone=? WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, patientName);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, disease);
            ps.setString(5, phone);
            ps.setInt(6, id);

            int i = ps.executeUpdate();

            if(i > 0) {

                response.sendRedirect(
                "GetPatientsServlet"
                );

            } else {

                response.getWriter().println(
                "<h2>Update Failed</h2>"
                );
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}

