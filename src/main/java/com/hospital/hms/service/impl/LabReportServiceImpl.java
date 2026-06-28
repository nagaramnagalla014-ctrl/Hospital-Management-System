package com.hospital.hms.service.impl;

import com.hospital.hms.dao.LabReportDAO;
import com.hospital.hms.model.LabReport;
import com.hospital.hms.service.LabReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class LabReportServiceImpl implements LabReportService {

    @Autowired
    private LabReportDAO labReportDAO;

    @Override
    public void saveReport(LabReport labReport) {
        labReport.setReportNo(generateReportNo());
        labReport.setStatus("PENDING");
        labReport.setCreatedOn(new Date());
        labReportDAO.save(labReport);
    }

    @Override
    public void updateReport(LabReport labReport) {
        labReportDAO.update(labReport);
    }

    @Override
    @Transactional(readOnly = true)
    public LabReport getReportById(Long reportId) {
        return labReportDAO.findById(reportId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<LabReport> getAllReports() {
        return labReportDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<LabReport> getReportsByPatient(Long patientId) {
        return labReportDAO.findByPatient(patientId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<LabReport> getPendingReports() {
        return labReportDAO.findByStatus("PENDING");
    }

    @Override
    @Transactional(readOnly = true)
    public long getTotalReports() {
        return labReportDAO.count();
    }

    @Override
    @Transactional(readOnly = true)
    public String generateReportNo() {
        long count = labReportDAO.count() + 1;
        return String.format("LAB-%06d", count);
    }
}
