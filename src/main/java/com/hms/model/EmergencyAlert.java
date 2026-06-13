
package com.hms.model;

public class EmergencyAlert {

    private int id;

    private String patientName;

    private String emergencyType;

    private String roomNo;

    private String alertTime;

    private String status;

    public EmergencyAlert() {

    }

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getPatientName() {

        return patientName;
    }

    public void setPatientName(String patientName) {

        this.patientName = patientName;
    }

    public String getEmergencyType() {

        return emergencyType;
    }

    public void setEmergencyType(String emergencyType) {

        this.emergencyType = emergencyType;
    }

    public String getRoomNo() {

        return roomNo;
    }

    public void setRoomNo(String roomNo) {

        this.roomNo = roomNo;
    }

    public String getAlertTime() {

        return alertTime;
    }

    public void setAlertTime(String alertTime) {

        this.alertTime = alertTime;
    }

    public String getStatus() {

        return status;
    }

    public void setStatus(String status) {

        this.status = status;
    }
}