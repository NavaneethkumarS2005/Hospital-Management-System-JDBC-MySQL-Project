
package com.hms.model;

public class LabReport {

    private int id;

    private String patientName;

    private String testName;

    private String result;

    private String reportDate;

    private String remarks;

    public LabReport() {

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

    public String getTestName() {

        return testName;
    }

    public void setTestName(String testName) {

        this.testName = testName;
    }

    public String getResult() {

        return result;
    }

    public void setResult(String result) {

        this.result = result;
    }

    public String getReportDate() {

        return reportDate;
    }

    public void setReportDate(String reportDate) {

        this.reportDate = reportDate;
    }

    public String getRemarks() {

        return remarks;
    }

    public void setRemarks(String remarks) {

        this.remarks = remarks;
    }
}