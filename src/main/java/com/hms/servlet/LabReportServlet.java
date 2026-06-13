
package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.LabReportDAO;
import com.hms.model.LabReport;

@WebServlet("/LabReportServlet")
public class LabReportServlet
extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String patientName =
        request.getParameter("patientName");

        String testName =
        request.getParameter("testName");

        String result =
        request.getParameter("result");

        String reportDate =
        request.getParameter("reportDate");

        String remarks =
        request.getParameter("remarks");

        LabReport l =
        new LabReport();

        l.setPatientName(patientName);

        l.setTestName(testName);

        l.setResult(result);

        l.setReportDate(reportDate);

        l.setRemarks(remarks);

        LabReportDAO dao =
        new LabReportDAO();

        boolean status =
        dao.addLabReport(l);

        if(status) {

            response.sendRedirect(
            "GetLabReportsServlet");

        } else {

            response.getWriter().println(
            "Failed to save lab report!");
        }
    }
}