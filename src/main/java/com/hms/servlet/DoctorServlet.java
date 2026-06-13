
package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.DoctorDAO;
import com.hms.model.Doctor;

@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String doctorName =
        request.getParameter("doctorName");

        String specialization =
        request.getParameter("specialization");

        int experience =
        Integer.parseInt(request.getParameter("experience"));

        String phone =
        request.getParameter("phone");

        Doctor d = new Doctor();

        d.setDoctorName(doctorName);
        d.setSpecialization(specialization);
        d.setExperience(experience);
        d.setPhone(phone);

        DoctorDAO dao =
        new DoctorDAO();

        boolean result =
        dao.addDoctor(d);

        if(result) {

            response.getWriter().println(
            "Doctor Added Successfully"
            );

        } else {

            response.getWriter().println(
            "Failed to Add Doctor"
            );
        }
    }
}
