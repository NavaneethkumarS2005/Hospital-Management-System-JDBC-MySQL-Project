
package com.hms.model;

public class Doctor {

    private int id;

    private String doctorName;

    private String specialization;

    private int experience;

    private String phone;

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getDoctorName() {

        return doctorName;
    }

    public void setDoctorName(
            String doctorName) {

        this.doctorName = doctorName;
    }

    public String getSpecialization() {

        return specialization;
    }

    public void setSpecialization(
            String specialization) {

        this.specialization = specialization;
    }

    public int getExperience() {

        return experience;
    }

    public void setExperience(
            int experience) {

        this.experience = experience;
    }

    public String getPhone() {

        return phone;
    }

    public void setPhone(
            String phone) {

        this.phone = phone;
    }
}