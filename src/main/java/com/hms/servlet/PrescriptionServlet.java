
package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.PrescriptionDAO;
import com.hms.model.Prescription;

@WebServlet("/PrescriptionServlet")
public class PrescriptionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String patientName =
        request.getParameter("patientName");

        String doctorName =
        request.getParameter("doctorName");

        String diagnosis =
        request.getParameter("diagnosis");

        String medicines =
        request.getParameter("medicines");

        String notes =
        request.getParameter("notes");

        Prescription p =
        new Prescription();

        p.setPatientName(patientName);

        p.setDoctorName(doctorName);

        p.setDiagnosis(diagnosis);

        p.setMedicines(medicines);

        p.setNotes(notes);

        PrescriptionDAO dao =
        new PrescriptionDAO();

        boolean status =
        dao.addPrescription(p);

        if(status) {

            response.sendRedirect(
            "GetPrescriptionsServlet");

        } else {

            response.getWriter().println(
            "Failed to save prescription!");
        }
    }
}
