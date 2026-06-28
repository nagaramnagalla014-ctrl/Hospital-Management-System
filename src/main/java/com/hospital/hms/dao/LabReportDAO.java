package com.hospital.hms.dao;

import com.hospital.hms.model.LabReport;
import java.util.List;

public interface LabReportDAO {
    void save(LabReport labReport);
    void update(LabReport labReport);
    LabReport findById(Long reportId);
    List<LabReport> findAll();
    List<LabReport> findByPatient(Long patientId);
    List<LabReport> findByStatus(String status);
    long count();
}
