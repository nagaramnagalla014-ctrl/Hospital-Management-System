package com.hospital.hms.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "MEDICINES")
public class Medicine {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "med_seq")
    @SequenceGenerator(name = "med_seq", sequenceName = "MED_SEQ", allocationSize = 1)
    @Column(name = "MEDICINE_ID")
    private Long medicineId;

    @Column(name = "MEDICINE_CODE", unique = true, nullable = false, length = 20)
    private String medicineCode;

    @Column(name = "MEDICINE_NAME", nullable = false, length = 100)
    private String medicineName;

    @Column(name = "GENERIC_NAME", length = 100)
    private String genericName;

    @Column(name = "CATEGORY", length = 50)
    private String category;

    @Column(name = "MANUFACTURER", length = 100)
    private String manufacturer;

    @Column(name = "UNIT_PRICE", nullable = false)
    private Double unitPrice;

    @Column(name = "QUANTITY_IN_STOCK")
    private Integer quantityInStock = 0;

    @Temporal(TemporalType.DATE)
    @Column(name = "EXPIRY_DATE")
    private Date expiryDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "CREATED_ON")
    private Date createdOn;

    public Medicine() {}

    public Long getMedicineId() { return medicineId; }
    public void setMedicineId(Long medicineId) { this.medicineId = medicineId; }

    public String getMedicineCode() { return medicineCode; }
    public void setMedicineCode(String medicineCode) { this.medicineCode = medicineCode; }

    public String getMedicineName() { return medicineName; }
    public void setMedicineName(String medicineName) { this.medicineName = medicineName; }

    public String getGenericName() { return genericName; }
    public void setGenericName(String genericName) { this.genericName = genericName; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getManufacturer() { return manufacturer; }
    public void setManufacturer(String manufacturer) { this.manufacturer = manufacturer; }

    public Double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(Double unitPrice) { this.unitPrice = unitPrice; }

    public Integer getQuantityInStock() { return quantityInStock; }
    public void setQuantityInStock(Integer quantityInStock) { this.quantityInStock = quantityInStock; }

    public Date getExpiryDate() { return expiryDate; }
    public void setExpiryDate(Date expiryDate) { this.expiryDate = expiryDate; }

    public Date getCreatedOn() { return createdOn; }
    public void setCreatedOn(Date createdOn) { this.createdOn = createdOn; }
}
