
package com.hms.model;

public class Patient {

    private int id;

    private String patientName;

    private int age;

    private String gender;

    private String disease;

    private String phone;

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

    public int getAge() {

        return age;
    }

    public void setAge(int age) {

        this.age = age;
    }

    public String getGender() {

        return gender;
    }

    public void setGender(
            String gender) {

        this.gender = gender;
    }

    public String getDisease() {

        return disease;
    }

    public void setDisease(
            String disease) {

        this.disease = disease;
    }

    public String getPhone() {

        return phone;
    }

    public void setPhone(
            String phone) {

        this.phone = phone;
    }
}