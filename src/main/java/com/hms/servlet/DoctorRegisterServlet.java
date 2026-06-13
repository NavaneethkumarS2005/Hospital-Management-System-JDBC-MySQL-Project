
package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.DoctorUserDAO;
import com.hms.model.DoctorUser;
import com.hms.util.EmailUtility;
@WebServlet("/DoctorRegisterServlet")
public class DoctorRegisterServlet
extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String doctorName =
        request.getParameter("doctorName");

        String email =
        request.getParameter("email");

        String password =
        request.getParameter("password");

        String specialization =
        request.getParameter("specialization");

        DoctorUser d =
        new DoctorUser();

        d.setDoctorName(doctorName);

        d.setEmail(email);

        d.setPassword(password);

        d.setSpecialization(specialization);

        DoctorUserDAO dao =
        new DoctorUserDAO();

        boolean status =
        dao.registerDoctor(d);

        if(status) {
        			EmailUtility.sendEmail(

        			email,

        			"Doctor Registration Successful",

        			"Welcome Dr. "
        			+ doctorName
        			+ ". Your HMS doctor account has been created successfully."
        			);
            response.sendRedirect(
            "doctorLogin.jsp");

        } else {

            response.getWriter().println(
            "Doctor Registration Failed!");
        }
    }
}

