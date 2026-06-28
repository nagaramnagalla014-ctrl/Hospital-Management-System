package com.hospital.hms.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "LAB_REPORTS")
public class LabReport {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "lab_seq")
    @SequenceGenerator(name = "lab_seq", sequenceName = "LAB_SEQ", allocationSize = 1)
    @Column(name = "REPORT_ID")
    private Long reportId;

    @Column(name = "REPORT_NO", unique = true, nullable = false, length = 20)
    private String reportNo;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PATIENT_ID")
    private Patient patient;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "DOCTOR_ID")
    private Doctor doctor;

    @Column(name = "TEST_NAME", nullable = false, length = 100)
    private String testName;

    @Column(name = "TEST_CATEGORY", length = 50)
    private String testCategory;

    @Temporal(TemporalType.DATE)
    @Column(name = "TEST_DATE", nullable = false)
    private Date testDate;

    @Column(name = "RESULT", length = 500)
    private String result;

    @Column(name = "NORMAL_RANGE", length = 100)
    private String normalRange;

    @Column(name = "UNIT", length = 20)
    private String unit;

    @Column(name = "STATUS", length = 15)
    private String status = "PENDING";

    @Column(name = "REMARKS", length = 300)
    private String remarks;

    @Column(name = "CHARGES")
    private Double charges;

    @Temporal(TemporalType.DATE)
    @Column(name = "CREATED_ON")
    private Date createdOn;

    public LabReport() {}

    public Long getReportId() { return reportId; }
    public void setReportId(Long reportId) { this.reportId = reportId; }

    public String getReportNo() { return reportNo; }
    public void setReportNo(String reportNo) { this.reportNo = reportNo; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }

    public Doctor getDoctor() { return doctor; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }

    public String getTestName() { return testName; }
    public void setTestName(String testName) { this.testName = testName; }

    public String getTestCategory() { return testCategory; }
    public void setTestCategory(String testCategory) { this.testCategory = testCategory; }

    public Date getTestDate() { return testDate; }
    public void setTestDate(Date testDate) { this.testDate = testDate; }

    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }

    public String getNormalRange() { return normalRange; }
    public void setNormalRange(String normalRange) { this.normalRange = normalRange; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }

    public Double getCharges() { return charges; }
    public void setCharges(Double charges) { this.charges = charges; }

    public Date getCreatedOn() { return createdOn; }
    public void setCreatedOn(Date createdOn) { this.createdOn = createdOn; }
}
