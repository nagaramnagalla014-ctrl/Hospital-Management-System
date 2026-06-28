package com.hospital.hms.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "DEPARTMENTS")
public class Department {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "dept_seq")
    @SequenceGenerator(name = "dept_seq", sequenceName = "DEPT_SEQ", allocationSize = 1)
    @Column(name = "DEPT_ID")
    private Long deptId;

    @Column(name = "DEPT_NAME", nullable = false, length = 100)
    private String deptName;

    @Column(name = "DESCRIPTION", length = 300)
    private String description;

    @Temporal(TemporalType.DATE)
    @Column(name = "CREATED_ON")
    private Date createdOn;

    public Department() {}

    public Department(String deptName, String description) {
        this.deptName = deptName;
        this.description = description;
        this.createdOn = new Date();
    }

    public Long getDeptId() { return deptId; }
    public void setDeptId(Long deptId) { this.deptId = deptId; }

    public String getDeptName() { return deptName; }
    public void setDeptName(String deptName) { this.deptName = deptName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Date getCreatedOn() { return createdOn; }
    public void setCreatedOn(Date createdOn) { this.createdOn = createdOn; }
}
