
package com.hms.model;

public class DoctorUser {

    private int id;

    private String doctorName;

    private String email;

    private String password;

    private String specialization;

    public DoctorUser() {

    }

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getDoctorName() {

        return doctorName;
    }

    public void setDoctorName(String doctorName) {

        this.doctorName = doctorName;
    }

    public String getEmail() {

        return email;
    }

    public void setEmail(String email) {

        this.email = email;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public String getSpecialization() {

        return specialization;
    }

    public void setSpecialization(String specialization) {

        this.specialization = specialization;
    }
}