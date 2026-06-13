
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

@WebServlet("/DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(request.getParameter("id"));

        try {

            Connection con =
            DBConnection.getConnection();

            String query =
            "DELETE FROM doctors WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if(i > 0) {

                response.sendRedirect(
                "GetDoctorsServlet"
                );

            } else {

                response.getWriter().println(
                "<h2>Delete Failed</h2>"
                );
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}

