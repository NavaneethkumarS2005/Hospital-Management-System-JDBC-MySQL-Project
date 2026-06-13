
package com.hms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.dao.BillDAO;
import com.hms.model.Bill;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String patientName =
        request.getParameter("patientName");

        String doctorName =
        request.getParameter("doctorName");

        double amount =
        Double.parseDouble(request.getParameter("amount"));

        String paymentStatus =
        request.getParameter("paymentStatus");

        Bill b = new Bill();

        b.setPatientName(patientName);
        b.setDoctorName(doctorName);
        b.setAmount(amount);
        b.setPaymentStatus(paymentStatus);

        BillDAO dao =
        new BillDAO();

        boolean result =
        dao.addBill(b);

        if(result) {

            response.getWriter().println(
            "Bill Generated Successfully"
            );

        } else {

            response.getWriter().println(
            "Failed to Generate Bill"
            );
        }
    }
}

