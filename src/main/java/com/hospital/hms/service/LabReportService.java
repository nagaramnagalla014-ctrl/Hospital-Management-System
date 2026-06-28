package com.hospital.hms.service;

import com.hospital.hms.model.LabReport;
import java.util.List;

public interface LabReportService {
    void saveReport(LabReport labReport);
    void updateReport(LabReport labReport);
    LabReport getReportById(Long reportId);
    List<LabReport> getAllReports();
    List<LabReport> getReportsByPatient(Long patientId);
    List<LabReport> getPendingReports();
    long getTotalReports();
    String generateReportNo();
}
