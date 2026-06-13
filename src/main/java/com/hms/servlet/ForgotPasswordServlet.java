
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

@WebServlet("/ForgotPasswordServlet")

public class ForgotPasswordServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String email =
        request.getParameter("email");

        String newPassword =
        request.getParameter("newPassword");

        try {

            Connection con =
            DBConnection.getConnection();

            String query =

            "UPDATE users "
            + "SET password=? "
            + "WHERE email=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(
            1,
            newPassword);

            ps.setString(
            2,
            email);

            int rows =
            ps.executeUpdate();

            if(rows > 0){

                response.sendRedirect(
                "login.jsp");

            } else {

                response.getWriter().println(

                "Email not found!");

            }

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}