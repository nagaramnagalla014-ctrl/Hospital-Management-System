package com.hospital.hms.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "BILLS")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bill_seq")
    @SequenceGenerator(name = "bill_seq", sequenceName = "BILL_SEQ", allocationSize = 1)
    @Column(name = "BILL_ID")
    private Long billId;

    @Column(name = "BILL_NO", unique = true, nullable = false, length = 20)
    private String billNo;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PATIENT_ID")
    private Patient patient;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "APPOINTMENT_ID")
    private Appointment appointment;

    @Column(name = "CONSULTATION_FEE")
    private Double consultationFee = 0.0;

    @Column(name = "LAB_CHARGES")
    private Double labCharges = 0.0;

    @Column(name = "MEDICINE_CHARGES")
    private Double medicineCharges = 0.0;

    @Column(name = "OTHER_CHARGES")
    private Double otherCharges = 0.0;

    @Column(name = "DISCOUNT")
    private Double discount = 0.0;

    @Column(name = "TOTAL_AMOUNT", nullable = false)
    private Double totalAmount;

    @Column(name = "STATUS", length = 10)
    private String status = "PENDING";

    @Temporal(TemporalType.DATE)
    @Column(name = "BILL_DATE")
    private Date billDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "CREATED_ON")
    private Date createdOn;

    public Bill() {}

    public Double calculateTotal() {
        double subtotal = (consultationFee != null ? consultationFee : 0)
                + (labCharges != null ? labCharges : 0)
                + (medicineCharges != null ? medicineCharges : 0)
                + (otherCharges != null ? otherCharges : 0);
        return subtotal - (discount != null ? discount : 0);
    }

    public Long getBillId() { return billId; }
    public void setBillId(Long billId) { this.billId = billId; }

    public String getBillNo() { return billNo; }
    public void setBillNo(String billNo) { this.billNo = billNo; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }

    public Appointment getAppointment() { return appointment; }
    public void setAppointment(Appointment appointment) { this.appointment = appointment; }

    public Double getConsultationFee() { return consultationFee; }
    public void setConsultationFee(Double consultationFee) { this.consultationFee = consultationFee; }

    public Double getLabCharges() { return labCharges; }
    public void setLabCharges(Double labCharges) { this.labCharges = labCharges; }

    public Double getMedicineCharges() { return medicineCharges; }
    public void setMedicineCharges(Double medicineCharges) { this.medicineCharges = medicineCharges; }

    public Double getOtherCharges() { return otherCharges; }
    public void setOtherCharges(Double otherCharges) { this.otherCharges = otherCharges; }

    public Double getDiscount() { return discount; }
    public void setDiscount(Double discount) { this.discount = discount; }

    public Double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(Double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Date getBillDate() { return billDate; }
    public void setBillDate(Date billDate) { this.billDate = billDate; }

    public Date getCreatedOn() { return createdOn; }
    public void setCreatedOn(Date createdOn) { this.createdOn = createdOn; }
}
