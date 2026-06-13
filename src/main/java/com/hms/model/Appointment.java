
package com.hms.model;

public class Appointment {

    private int id;

    private String patientName;

    private String doctorName;

    private String appointmentDate;

    private String status;

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getPatientName() {

        return patientName;
    }

    public void setPatientName(
            String patientName) {

        this.patientName = patientName;
    }

    public String getDoctorName() {

        return doctorName;
    }

    public void setDoctorName(
            String doctorName) {

        this.doctorName = doctorName;
    }

    public String getAppointmentDate() {

        return appointmentDate;
    }

    public void setAppointmentDate(
            String appointmentDate) {

        this.appointmentDate =
        appointmentDate;
    }

    public String getStatus() {

        return status;
    }

    public void setStatus(
            String status) {

        this.status = status;
    }
}