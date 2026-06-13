
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

@WebServlet("/UpdateDoctorServlet")
public class UpdateDoctorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(request.getParameter("id"));

        String doctorName =
        request.getParameter("doctorName");

        String specialization =
        request.getParameter("specialization");

        int experience =
        Integer.parseInt(request.getParameter("experience"));

        String phone =
        request.getParameter("phone");

        try {

            Connection con =
            DBConnection.getConnection();

            		String query =
            		"UPDATE doctor_users SET doctor_name=?, specialization=?, experience=?, phone=? WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, doctorName);
            ps.setString(2, specialization);
            ps.setInt(3, experience);
            ps.setString(4, phone);
            ps.setInt(5, id);

            int i = ps.executeUpdate();

            if(i > 0) {

                response.sendRedirect(
                "GetDoctorsServlet"
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

