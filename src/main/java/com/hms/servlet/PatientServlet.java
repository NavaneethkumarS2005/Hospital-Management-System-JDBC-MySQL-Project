
package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.PatientDAO;
import com.hms.model.Patient;

@WebServlet("/PatientServlet")
public class PatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

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

        Patient p = new Patient();

        p.setPatientName(patientName);
        p.setAge(age);
        p.setGender(gender);
        p.setDisease(disease);
        p.setPhone(phone);

        PatientDAO dao =
        new PatientDAO();

        boolean result =
        dao.addPatient(p);

        if(result) {

            response.getWriter().println(
            "Patient Added Successfully"
            );

        } else {

            response.getWriter().println(
            "Failed to Add Patient"
            );
        }
    }
}

